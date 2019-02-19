class Skill < ApplicationRecord
  belongs_to :user
  belongs_to :sport

  enum level:
  [
    :never_tried_this_before,
    :beginner,
    :intermediate,
    :advanced,
    :champion  
  ]
end
