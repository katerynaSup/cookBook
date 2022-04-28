class AddIngredientsToPosts < ActiveRecord::Migration[7.0]
  def change
    add_column :posts, :ingredients, :string
  end
end
