class CreateIngredientsRecipes < ActiveRecord::Migration[5.1]
  def change
    create_table :ingredients_recipes do |t|
      t.integer :amount, null: false
      t.string :measurement, null: false
      t.references :recipe, null: false
      t.references :ingredient, null: false

      t.timestamps
    end
  end
end
