class CreateInstructionsRecipes < ActiveRecord::Migration[5.1]
  def change
    create_table :instructions_recipes do |t|
      t.references :recipe, null: false
      t.references :instruction, null: false

      t.timestamps
    end
  end
end
