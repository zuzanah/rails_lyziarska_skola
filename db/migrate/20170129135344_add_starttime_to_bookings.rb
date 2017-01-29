class AddStarttimeToBookings < ActiveRecord::Migration[5.0]
  def change
    add_column :bookings, :starttime, :time
  end
end
