class CreateInstructions < ActiveRecord::Migration[5.1]
  def change
    create_table :instructions do |t|
      t.integer :position, null: false
      t.text :step, null: false

      t.timestamps
    end
  end
end
