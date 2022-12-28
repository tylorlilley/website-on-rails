class AddMacVersionToGames < ActiveRecord::Migration[6.1]
  def change
    add_column :games, :mac_version, :boolean
  end
end
