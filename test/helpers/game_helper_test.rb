require 'test_helper'

class GamesHelperTest < ActionView::TestCase

  def setup
    @game = Game.first
  end

  test "formated release date for" do
    assert_equal formated_release_date_for(@game), "October 8th, 2019"
    assert_equal formated_release_date_for(nil), ""
    @game.date = "2019-10-01"
    assert_equal formated_release_date_for(@game), "October 1st, 2019"
    @game.date = nil
    assert_equal formated_release_date_for(@game), ""
  end

  test "formated name for" do
    assert_equal formated_name_for(@game), "Example Game - October 8th, 2019"
    assert_equal formated_name_for(nil), ""
    @game.name = nil
    assert_equal formated_name_for(@game), "October 8th, 2019"
    @game.date = nil
    assert_equal formated_name_for(@game), ""
  end

  test "formated teaser for" do
    assert_equal formated_teaser_for(@game), "<p>This is an example game description...#{link_to "(view more)", @game}</p>"
    assert_equal formated_teaser_for(nil), ""
    @game.description = nil
    assert_equal formated_teaser_for(@game), ""
  end

  test "formated description for" do
    assert_equal formated_description_for(@game), "<p>This is an example game "+
      "description.</p><p>This is another line of the description.</p><p></p><p>Concluding game description.</p>"
    assert_equal formated_description_for(nil), ""
    @game.description = nil
    assert_equal formated_description_for(@game), ""
  end

  test "formated tagline for" do
    assert_equal formated_tagline_for(@game), "\"This is an example tagline.\""
    assert_equal formated_tagline_for(nil), ""
    @game.tagline = nil
    assert_equal formated_tagline_for(@game), ""
  end

  test "screenshot filename for" do
    assert_equal screenshot_filename_for(@game, 1), "example_1.png"
    assert_equal screenshot_filename_for(@game, 2), "example_2.png"
    assert_equal screenshot_filename_for(@game, nil), ""
    assert_equal screenshot_filename_for(nil, 3), ""
    @game.filename = nil
    assert_equal screenshot_filename_for(@game, 3), ""
  end

  test "download filename for" do
    assert_equal download_filename_for(@game), "http://tylorlilley.s3.amazonaws.com/games/tylorlilley_#{@game.filename}.zip"
    assert_equal download_filename_for(nil), ""
    @game.filename = nil
    assert_equal download_filename_for(@game), ""
  end

  test "screenshot width for" do
    assert_equal screenshot_width_for(@game), 600
    assert_equal screenshot_width_for(nil), 0
    @game.image_width = nil
    assert_equal screenshot_width_for(@game), 0
  end

  test "screenshot height for" do
    assert_equal screenshot_height_for(@game), 500
    assert_equal screenshot_height_for(nil), 0
    @game.image_height = nil
    assert_equal screenshot_height_for(@game), 0
  end


end
