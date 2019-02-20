class Event < ApplicationRecord
  has_many :participations
  has_many :users, through: :participations
  has_many :comments

  belongs_to :sport
  belongs_to :place, optional: true

  accepts_nested_attributes_for :sport
  accepts_nested_attributes_for :place

end
