class Instructor < ApplicationRecord
  has_many :bookings, :dependent => :destroy
  accepts_nested_attributes_for :bookings, :allow_destroy => true
  enum instructor_type: [:ski, :snowboard]
end
