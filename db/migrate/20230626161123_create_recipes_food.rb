class CreateRecipesFood < ActiveRecord::Migration[7.0]
  def change
    create_table :recipe_foods do |t|
      t.integer :quantity
      t.integer :food_id
      t.integer :recipe_id

      t.timestamps
    end
  end
end
