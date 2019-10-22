class AddImageWidthToGames < ActiveRecord::Migration[6.0]
  def change
    add_column :games, :image_width, :integer
  end
end
