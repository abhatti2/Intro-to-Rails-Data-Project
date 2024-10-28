class Comment < ApplicationRecord
  # Associations
  belongs_to :user
  belongs_to :breed

  # Validations
  validates :content, presence: true, length: { minimum: 5 }  # Content must be present and at least 5 characters long

  # validate associations
  validates :user_id, presence: true
  validates :breed_id, presence: true
end
