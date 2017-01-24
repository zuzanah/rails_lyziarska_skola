ActiveAdmin.register Rcomment do
  menu false

  belongs_to :rating, :optional => true

  permit_params :body, :user_id, :rating_id

end
