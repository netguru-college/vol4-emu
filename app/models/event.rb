class Event < ApplicationRecord

  validates :title, :capacity, :ended_at, :started_at, presence: true
  validates :description, length: {minimum: 10, maximum: 500}, presence: true
  validates :capacity, numericality: {only_integer: true, greater_than: 1}
  validates :capacity, event_is_full: true
  validates :started_at, event_cannot_be_in_past: true
  validates :started_at, start_date_before_end_date: true

  has_many :participations, dependent: :destroy
  has_many :users, through: :participations
  has_many :comments, dependent: :destroy
  belongs_to :sport
  belongs_to :place

  accepts_nested_attributes_for :sport
  accepts_nested_attributes_for :place

  def owner
    self.participations.find_by(role: "owner")&.user
  end

  def participants
    self.participations.where.not(role: "owner").map(&:user)
  end

  filterrific(
      default_filter_params: {},
      available_filters: [
          :search_query,
          :with_sport_id
      ]
  )

  scope :search_query, ->(query) {
    terms = query.downcase.split(/\s+/)

    where("title LIKE ?", "%#{terms}%")
  }
  scope :with_sport_id, ->(sport_ids) {
    where(sport_id: [*sport_ids])
  }
end
