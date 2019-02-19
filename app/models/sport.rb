class Sport < ApplicationRecord
  has_many :skills
  has_many :users, through: :skills
  #has_many :events
end
