class RemoveStartdayFromBookings < ActiveRecord::Migration[5.0]
  def change
    remove_column :bookings, :startday, :date
  end
end
