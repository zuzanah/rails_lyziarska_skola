class Rating < ApplicationRecord
  belongs_to :user
  has_many :rcomments
end
