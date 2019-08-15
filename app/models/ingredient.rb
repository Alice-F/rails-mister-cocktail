class Ingredient < ApplicationRecord
  has_many :doses
  # An ingredient must have a unique name.
  validates :name, uniqueness: true, presence: true
end
