class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :participations
  has_many :events, through: :participations
  has_many :comments
  
  mount_uploader :avatar, AvatarUploader
  
  has_many :skills
  has_many :sports, through: :skills

  accepts_nested_attributes_for :skills, :allow_destroy => true

  def create_event_as_owner(attributes)
    event = events.create(attributes)
    event.tap { |event| event.participations.find_by(user: self)&.owner! }
  end

  def skill_level(sport_name)
    self.skills.joins(:sport).find_by("sports.name = ?", sport_name)&.level
  end
end
