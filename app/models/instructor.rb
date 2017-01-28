class Instructor < ApplicationRecord
  has_many :bookings

  enum instructor_type: [:ski, :snowboard]
end
