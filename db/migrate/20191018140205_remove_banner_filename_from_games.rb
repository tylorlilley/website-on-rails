class RemoveBannerFilenameFromGames < ActiveRecord::Migration[6.0]
  def change

    remove_column :games, :banner_filename, :string
  end
end
