class Event < ApplicationRecord
  has_many :participations
  has_many :users, through: :participations
  # belongs_to :sport
  has_many :comments
end
