class AddColumnsToFavorites < ActiveRecord::Migration[7.0]
  def change
    add_column :favorites, :user_id, :integer, null: false
    add_column :favorites, :name, :string, null: false
    add_column :favorites, :url, :string
    add_column :favorites, :image, :string
    add_column :favorites, :ingredients, :string
  end
end
