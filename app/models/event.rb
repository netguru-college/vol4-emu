class Event < ApplicationRecord
  has_many :participations
  has_many :users, through: :participations
  has_many :comments

  belongs_to :sport
  accepts_nested_attributes_for :sport
end
