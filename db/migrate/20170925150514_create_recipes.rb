class CreateRecipes < ActiveRecord::Migration[5.1]
  def change
    create_table :recipes do |t|
      t.string :name, null: false
      t.string :category, index: true, null: false
      t.integer :difficulty_level, null: false
      t.integer :prep_time, null: false
      t.text :directions, null: false
      t.string :creator, null: false
      t.references :ingredient, index: true, null: false
      t.references :submitter, null: false

      t.timestamps
    end
  end
end
