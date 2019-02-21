class Participation < ApplicationRecord

  belongs_to :event
  belongs_to :user

  enum role: [ "owner", "participant" ]
  validates :event, event_is_full: true
end
