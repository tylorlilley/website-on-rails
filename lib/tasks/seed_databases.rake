require 'csv'

namespace :import do
  desc 'Imports csv data into db'
  task from_csv: :environment do
    csv_text = File.read('./db/seeds/posts.csv')
    csv = CSV.parse(csv_text, :headers => true)
    csv.each do |row|
      Post.create!(row.to_hash)
    end

    csv_text = File.read('./db/seeds/games.csv')
    csv = CSV.parse(csv_text, :headers => true)
    csv.each do |row|
      Game.create!(row.to_hash)
    end
  end
end
