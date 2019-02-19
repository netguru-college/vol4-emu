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
end
