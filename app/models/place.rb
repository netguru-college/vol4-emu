class Place < ApplicationRecord
    validates :name, presence: true

    geocoded_by :name
    after_validation :geocode
end
