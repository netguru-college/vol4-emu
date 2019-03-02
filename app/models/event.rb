class Event < ApplicationRecord

  validates :title, :capacity, :ended_at, :started_at, presence: true
  validates :description, length: {minimum: 10, maximum: 500}, presence: true
  validates :capacity, numericality: {only_integer: true, greater_than: 1}
  validates :started_at, event_cannot_be_in_past: true
  validates :started_at, start_date_before_end_date: true

  has_many :participations, dependent: :destroy
  has_many :users, through: :participations
  has_many :comments, dependent: :destroy
  belongs_to :sport
  belongs_to :place

  accepts_nested_attributes_for :sport
  accepts_nested_attributes_for :place

  paginates_per 7

  def owner
    participations.find_by(role: "owner")&.user
  end

  def participants
    participations.where.not(role: "owner").map(&:user)
  end

  def create_place_with_coords(attributes)
    create_place(attributes)
    data = Geocoder.search(place.name).first&.coordinates
    if data
      place.latitude = (data[0] if data) || 0
      place.longitude = (data[1] if data) || 0
    end
  end

  def place_map_href
    base_str = "https://maps.googleapis.com/maps/api/staticmap?"
    params = "center=#{CGI::escape(place.name)}&zoom=14&size=200x200&key=#{Rails.application.credentials.google_maps_api_key}"
    if place.latitude && place.longitude
      params += "&markers=size:small%7Ccolor:red%7C#{place.latitude},#{place.longitude}"
    end
    base_str + params
  end

  def get_current_weather
    ForecastIO.forecast(place.latitude, place.longitude, params: {units: 'si'})
  end

  filterrific(
      default_filter_params: {},
      available_filters: [
          :search_query,
          :with_sport_id
      ]
  )

  scope :search_query, ->(query) {
    terms = query.downcase.split(/\s+/).join

    where("LOWER(title) LIKE ?", "%#{terms}%")
  }
  scope :with_sport_id, ->(sport_ids) {
    where(sport_id: [*sport_ids])
  }
end
