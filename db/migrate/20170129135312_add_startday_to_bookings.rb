class AddStartdayToBookings < ActiveRecord::Migration[5.0]
  def change
    add_column :bookings, :startday, :date
  end
end
