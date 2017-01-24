class CreateRatingComments < ActiveRecord::Migration[5.0]
  def change
    create_table :rating_comments do |t|
      t.text :body
      t.references :user, foreign_key: true
      t.references :rating, foreign_key: true

      t.timestamps
    end
  end
end
