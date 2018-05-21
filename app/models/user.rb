class User < ApplicationRecord
  validates :user_name, presence: true, 
            uniqueness: { case_sensitive: false }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :user_email, presence: true, 
            uniqueness: { case_sensitive: false }, 
            format: { with: VALID_EMAIL_REGEX }
end