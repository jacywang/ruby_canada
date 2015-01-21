class User < ActiveRecord::Base
  has_many :topics
  has_many :comments

  has_secure_password validations: false

  validates :username, presence: true, uniqueness: true
  validates :password, on: :create, length: { minimum: 5 }
end