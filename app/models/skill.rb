class Skill < ApplicationRecord
  belongs_to :user
  belongs_to :sport

  # validates_uniqueness_of :sport, scope: :user
  validates_uniqueness_of :user_id, scope: :sport_id

  enum level:
  [
    "No experience",
    "Beginner",
    "Intermediate",
    "Advanced",
    "World Champion"  
  ]
end
