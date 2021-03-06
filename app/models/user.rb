# Uzivatelia
class User < ApplicationRecord
  has_secure_password
  has_many :ratings
  has_many :rcomments
  has_many :bookings

  validates_uniqueness_of :email
  validates :email, :password, :nickname, presence: true
end
