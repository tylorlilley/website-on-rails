class AddItchToGames < ActiveRecord::Migration[6.1]
  def change
    add_column :games, :itch, :boolean
  end
end
