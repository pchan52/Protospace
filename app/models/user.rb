class User < ActiveRecord::Base
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  mount_uploader :avatar, UserImageUploader

  has_many :prototypes
  has_many :likes
  
  has_many :comments
  validates :name, :password, :email, presence: true

  paginates_per 8
end
