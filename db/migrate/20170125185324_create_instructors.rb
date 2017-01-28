class CreateInstructors < ActiveRecord::Migration[5.0]
  def change
    create_table :instructors do |t|
      t.string :name
      t.integer :instructor_type

      t.timestamps
    end
  end
end
