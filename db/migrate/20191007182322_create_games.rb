class CreateGames < ActiveRecord::Migration[6.0]
  def change
    create_table :games do |t|
      t.string :name
      t.text :description
      t.date :date
      t.string :tagline
      t.string :banner_filename
      t.string :screenshot_filename
      t.string :game_filename

      t.timestamps
    end
  end
end
