class Event < ApplicationRecord

  validates :title, :capacity, :ended_at, :started_at, presence: true
  validates :description, length: {minimum: 10, maximum: 500}, presence: true
  validates :started_at, event_cannot_be_in_past: true
  validates :ended_at, start_date_before_end_date: true
  validates :capacity, numericality: {only_integer: true}


  #validates :ended_at, :started_at, inclusion: {in: ->(date) {(Date.today)}}

  has_many :participations
  has_many :users, through: :participations

end
