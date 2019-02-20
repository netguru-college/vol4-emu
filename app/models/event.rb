class Event < ApplicationRecord
  has_many :participations, dependent: :destroy
  has_many :users, through: :participations
  has_many :comments, dependent: :destroy

  belongs_to :sport
  accepts_nested_attributes_for :sport
end
