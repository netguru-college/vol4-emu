class Sport < ApplicationRecord
  has_many :users, through: :skills
end
