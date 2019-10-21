class RemoveScreenshotFilenameFromGames < ActiveRecord::Migration[6.0]
  def change

    remove_column :games, :screenshot_filename, :string
  end
end
