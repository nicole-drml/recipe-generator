class AddColumnsToFavorites < ActiveRecord::Migration[7.0]
  def change
    add_column :favorites, :name, :string
    add_column :favorites, :image_link, :string
    add_column :favorites, :ingredients, :string
  end
end
