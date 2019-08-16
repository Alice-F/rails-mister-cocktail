class Cocktail < ApplicationRecord
  has_many :doses, dependent: :destroy
  has_many :ingredients, through: :doses
  # A cocktail must have a unique name.
  validates :name, uniqueness: true, presence: true

  # uploader des photos
  mount_uploader :photo, PhotoUploader
end
