class Participation < ApplicationRecord
  belongs_to :event
  belongs_to :user

  enum role: [ "owner", "participant" ]
end
