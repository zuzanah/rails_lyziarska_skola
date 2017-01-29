class AddStartdateToBookings < ActiveRecord::Migration[5.0]
  def change
    add_column :bookings, :startdate, :date
  end
end
