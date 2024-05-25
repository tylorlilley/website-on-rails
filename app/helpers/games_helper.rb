module GamesHelper

  # Returns screenshot filename associated with a game
  def screenshot_filename_for(game, num)
    return "" if game.nil? || game.filename.nil? || num.nil?
    "games/#{game.filename}_#{num}.png"
  end

  # Returns download filename associated with a game
  def download_filename_for(game)
    return "" if game.nil? || game.filename.nil?
    return "https://tylorlilley.itch.io/#{game.filename}" if game.itch?
    "https://tylorlilley.s3.amazonaws.com/games/tylorlilley_#{game.filename}.zip"
  end

    # Returns download filename associated with a game's mac version
    def download_mac_filename_for(game)
      return "" if game.nil? || game.filename.nil?
      "https://tylorlilley.s3.amazonaws.com/games/tylorlilley_#{game.filename}_mac.zip"
    end

  # Returns the width of a screenshot associated with a game
  def screenshot_width_for(game)
    return 0 if game.nil? || game.image_width.nil?
    return game.image_width
  end

  # Returns the width of a screenshot associated with a game
  def screenshot_height_for(game)
    return 0 if game.nil? || game.image_height.nil?
    return game.image_height
  end

  # Returns the formatted post date
  def formated_release_date_for(game)
    return "" if game.nil?
    formated_date(game.date)
  end

  # Returns the combined title and date for a given game
  def formated_name_for(game)
    return formated_release_date_for(game) if game.nil? || game.name.nil?
    "#{game.name} - #{formated_release_date_for(game)}"
  end

  # Returns the tagline in quotes for a given game
  def formated_tagline_for(game)
    return "" if game.nil? || game.tagline.nil?
    return "\"#{game.tagline}\""
  end

  # Returns the first section of a game's description
  def formated_teaser_for(game)
    return "" if game.nil?
    formated_intro(description_for(game), game)
  end

  # Returns the game description formatted with HTML tags
  def formated_description_for(game)
    return "" if game.nil?
    formated_body(description_for(game))
  end

  # Returns the contents of the games's associated description file
  def description_for(game)
    File.read("app/views/games/description/_#{game.slug}.html.haml")
  end

end
