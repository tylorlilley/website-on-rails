require 'test_helper'

class PostsHelperTest < ActionView::TestCase

  def setup
    @post = Post.find_by(title: "Example Title")
  end

  test "formated date for" do
    assert_equal formated_date_for(@post), "October 7th, 2019"
    assert_equal formated_date_for(nil), ""
    @post.date = "2019-10-01"
    assert_equal formated_date_for(@post), "October 1st, 2019"
    @post.date = nil
    assert_equal formated_date_for(@post), ""
  end

  test "formated title for" do
    assert_equal formated_title_for(@post), "October 7th, 2019 - Example Title"
    assert_equal formated_title_for(nil), ""
    @post.title = nil
    assert_equal formated_title_for(@post), "October 7th, 2019"
    @post.date = nil
    assert_equal formated_title_for(@post), ""
  end

  test "formated intro for" do
    assert_equal formated_intro_for(@post), "<p>This is an example of a" +
                          " post's first paragraph. It has two sentances...#{link_to "(view more)", @post}</p>"
    assert_equal formated_intro_for(nil), ""
    @post.content = nil
    assert_equal formated_intro_for(@post), ""
    @post = Post.find_by(title: "Embedded Example Title")
    assert_equal formated_intro_for(@post),
  "<p>This is an example of a post's first paragraph. It has <i>two</i> sentances...#{link_to "(view more)", @post}</p>"
  end

  test "formated body for" do
    assert_equal formated_body_for(@post),
"<p>This is an example of a post's first paragraph. It has two sentances!</p>" +
"<p>This is an example of a post's second paragraph. It is a bit longer. It has three sentences.</p>" +
"<p>This is a concluding paragraph of a post, and it's only one sentance long.</p>"
    assert_equal formated_body_for(nil), ""
    @post.content = nil
    assert_equal formated_intro_for(@post), ""
    @post = Post.find_by(title: "Embedded Example Title")
    assert_equal formated_body_for(@post),
"<p>This is an example of a post's first paragraph. It has <i>two</i> sentances!</p>" +
"<p>This is an example of a post's second paragraph. It is a bit longer. It has <b>three</b> sentences.</p>" +
"<p>This is a concluding paragraph of a <a href=\"example.com\">post</a>, and it's only one sentance long.</p>"
  end

end
