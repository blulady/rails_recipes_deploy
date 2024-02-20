class CreateRecipes < ActiveRecord::Migration[7.1]
  def change
    create_table :recipes do |t|
      t.string :name
      t.string :description
      t.float :servings
      t.string :img_url
      t.text :instructions
      t.string :difficulty_level
      t.integer :cooking_time
      t.string :meal

      t.timestamps
    end
  end
end
