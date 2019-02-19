class Event < ApplicationRecord
  validates :title, presence: true
  has_many :participations
  has_many :users, through: :participations
  # belongs_to :sport
end
