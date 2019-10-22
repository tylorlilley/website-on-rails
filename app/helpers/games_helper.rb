module GamesHelper

  # Returns screenshot filename associated with a game
  def screenshot_filename_for(game, num)
    return "" if game.nil? || game.filename.nil? || num.nil?
    "#{game.filename}_#{num}.png"
  end

  # Returns download filename associated with a game
  def download_filename_for(game)
    return "" if game.nil? || game.filename.nil?
    "http://tylorlilley.s3.amazonaws.com/games/tylorlilley_#{game.filename}.zip"
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
    formated_intro(game.description)
  end

  # Returns the game description formatted with HTML tags
  def formated_description_for(game)
    return "" if game.nil?
    formated_body(game.description)
  end

end
