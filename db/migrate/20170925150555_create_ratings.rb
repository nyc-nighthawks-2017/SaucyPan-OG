class CreateRatings < ActiveRecord::Migration[5.1]
  def change
    create_table :ratings do |t|
      t.references :recipe, null: false
      t.references :rater, null: false
      t.integer :rating, null: false

      t.timestamps
    end
    add_index :ratings, [:recipe_id, :rater_id], :unique => true
  end
end
