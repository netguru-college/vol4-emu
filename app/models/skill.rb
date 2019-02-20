class Skill < ApplicationRecord
  belongs_to :user
  belongs_to :sport

  validates_uniqueness_of :sport, scope: :user

  enum level:
  [
    "No experience",
    "Beginner",
    "Intermediate",
    "Advanced",
    "World Champion"  
  ]
end
