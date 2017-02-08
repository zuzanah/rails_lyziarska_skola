# Komentare k hodnoteniam, vytvarat moze iba prihlaseny uzivatel
class Rcomment < ApplicationRecord
  belongs_to :user
  belongs_to :rating
end
