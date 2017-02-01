class Rating < ApplicationRecord
  belongs_to :user
  has_many :rcomments
  validates :body, presence: {:message => "Hodnotenie nemôže byť prázdne."}
end
