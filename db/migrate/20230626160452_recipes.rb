class Recipes < ActiveRecord::Migration[7.0]
  def change
    create_table :recipes do |t|
      t.string :name
      t.decimal :prepation_time
      t.decimal :cooking_time
      t.text :description
      t.boolean :public
      t.integer :user_id

      t.timestamps
    end
  end
end
