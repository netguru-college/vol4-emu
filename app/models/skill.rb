class Skill < ApplicationRecord
  belongs_to :user
  belongs_to :sport

  enum level:
  [
    :zero_experience,
    :beginner,
    :intermediate,
    :advanced,
    :champion  
  ]
end
