class User < ApplicationRecord
  has_many :favorites
  has_many :favorings, through: :favorites, source: :favorite
  has_many :reverse_of_favorites, class_name: 'Favorite', foreign_key: 'favorite_id'
  has_many :favoriters, through: :reverse_of_favorites, source: :user
  has_many :messages, dependent: :destroy
  has_many :entries, dependent: :destroy

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable


  validates :name, presence: true
  validates :name, length: { maximum: 10 }
  validates :comment, length: { maximum: 25 }
  validates :profile, length: { maximum: 500 }

  mount_uploader :image, ImageUploader

  def favorite_user(other_user)
    unless self == other_user
      self.favorites.find_or_create_by(favorite_id: other_user.id)
    end
  end

  def unfavorite(other_user)
    favorite = self.favorites.find_by(favorite_id: other_user.id)
    favorite.destroy if favorite
  end

  def favoring?(other_user)
    self.favorings.include?(other_user)
  end

end
