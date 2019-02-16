class Place < ActiveRecord::Base
  validates :address, presence: true
  geocoded_by :address
  after_validation :geocode
end