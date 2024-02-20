class ChangeServingsToBeFloatInRecipes < ActiveRecord::Migration[7.1]
  def change
    change_column :recipes, :servings, :float
  end
end
