class User < ApplicationRecord
  has_secure_password
  has_many :ratings
  validates_uniqueness_of :email
  validates :email, :password, :nickname, presence: true
end
