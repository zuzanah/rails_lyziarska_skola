ActiveAdmin.register Booking do
  permit_params :start, :user, :instructor, :body
end
