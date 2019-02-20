class Sport < ApplicationRecord
  has_many :skills
  has_many :users, through: :skills
  has_many :events

  def self.options_for_select
    Sport.order(name: :desc).map { |e| [e.name, e.id] }
  end
end
