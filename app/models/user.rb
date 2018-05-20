class User < ApplicationRecord
  validates :user_name, presence: true
  validates :user_email, presence: true
end