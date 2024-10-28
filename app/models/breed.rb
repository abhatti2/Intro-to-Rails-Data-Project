class Breed < ApplicationRecord
  # Association with comments
  has_many :comments, dependent: :destroy

  # Validations
  validates :name, presence: true, uniqueness: true

  # validate sub_breed
  validates :sub_breed, allow_blank: true, length: { maximum: 100 }
end
