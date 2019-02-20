class Event < ApplicationRecord

  validates :title, :capacity, :ended_at, :started_at, presence: true
  validates :description, length: {minimum: 10, maximum: 500}, presence: true
  validates :capacity, numericality: {only_integer: true, greater_than: 1}
  validates :started_at, event_cannot_be_in_past: true
  validates :started_at, start_date_before_end_date: true


  has_many :participations
  has_many :users, through: :participations
  has_many :comments
  belongs_to :sport
  accepts_nested_attributes_for :sport

end
