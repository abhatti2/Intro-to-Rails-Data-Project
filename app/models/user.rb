class User < ApplicationRecord
  # Association with comments
  has_many :comments, dependent: :destroy

  # Validations
  validates :name, presence: true
  validates :email, presence: true, uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP }

  # Ensures that email uniqueness is not case-sensitive (i.e., user@example.com and USER@EXAMPLE.COM would be considered the same).
  validates :email, uniqueness: { case_sensitive: false }
end
