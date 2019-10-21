class ChangeGameFilenameToFilename < ActiveRecord::Migration[6.0]
  def change
    rename_column :games, :game_filename, :filename
  end
end
