class Event < ApplicationRecord
  has_many :participations
  has_many :users, through: :participations
  has_many :comments

  belongs_to :sport
  accepts_nested_attributes_for :sport

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
