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
  belongs_to :place, optional: true

  accepts_nested_attributes_for :sport
  accepts_nested_attributes_for :place

  filterrific(
   default_filter_params: {},
   available_filters: [
     :search_query,
     :with_sport_id
   ]
  )

  scope :search_query, ->(query) {
    where("title LIKE ?", "%#{query}%")
  }
  scope :with_sport_id, ->(sport_ids) {
    where(sport_id: [*sport_ids])
  }
end
