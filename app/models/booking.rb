# Rezervacie lekcii, vytvarat moze iba prihlaseny uzivatel,
# kazda rezervacia je zaroven pridelena vybranemu instruktorovi
class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :instructor
  validates :startdate, presence: { message: 'Prosím zadajte dátum.' }
end
