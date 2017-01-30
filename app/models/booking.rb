class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :instructor
  validates :startdate, presence: true
  validates :starttime, presence: true
end
