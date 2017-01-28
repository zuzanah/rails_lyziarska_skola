class CreateBookings < ActiveRecord::Migration[5.0]
  def change
    create_table :bookings do |t|
      t.datetime :start
      t.references :user, foreign_key: true
      t.references :instructor, foreign_key: true
      t.text :body

      t.timestamps
    end
  end
end
