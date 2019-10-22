class AddImageHeightToGames < ActiveRecord::Migration[6.0]
  def change
    add_column :games, :image_height, :integer
  end
end
