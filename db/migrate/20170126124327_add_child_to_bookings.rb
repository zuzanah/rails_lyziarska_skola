class AddChildToBookings < ActiveRecord::Migration[5.0]
  def change
    add_column :bookings, :child, :boolean
  end
end
