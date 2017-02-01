class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :instructor
  validates :startdate, presence: {:message => "Prosím zadajte dátum."}
end
