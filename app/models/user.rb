class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  
  validates :name, presence: true
  validates :name, length: { maximum: 10 }
  validates :comment, length: { maximum: 25 }
  validates :profile, length: { maximum: 500 }

  mount_uploader :image, ImageUploader
end
