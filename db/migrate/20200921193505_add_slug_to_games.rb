class AddSlugToGames < ActiveRecord::Migration[6.0]
  def change
    add_column :games, :slug, :string
  end
end
