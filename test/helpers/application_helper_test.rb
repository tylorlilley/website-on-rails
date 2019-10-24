require 'test_helper'

class ApplicationHelperTest < ActionView::TestCase

  test "full title helper" do
    assert_equal full_title,         "Tylor Lilley"
    assert_equal full_title("Help"), "Help | Tylor Lilley"
  end

  test "formated date" do
    assert_equal formated_date(Date.new(2010, 2, 1)), "February 1st, 2010"
    assert_equal formated_date(Date.new(2010, 2, 2)), "February 2nd, 2010"
    assert_equal formated_date(Date.new(2010, 2, 3)), "February 3rd, 2010"
    assert_equal formated_date(Date.new(2010, 2, 4)), "February 4th, 2010"
    assert_equal formated_date(Date.new(2010, 6, 15)), "June 15th, 2010"
    assert_equal formated_date(nil), ""
  end

  test "formated intro" do
    assert_equal formated_intro("This is a test intro.", root_path), "<p>This is a test intro...#{link_to "(view more)", root_path}</p>"
    assert_equal formated_intro("This is a test intro.\nIt has multiple lines.", root_path), "<p>This is a test intro...#{link_to "(view more)", root_path}</p>"
    assert_equal formated_intro("This is a test intro!\nIt has multiple lines.", root_path), "<p>This is a test intro...#{link_to "(view more)", root_path}</p>"
    assert_equal formated_intro("1", root_path), "<p>...#{link_to "(view more)", root_path}</p>"
    assert_equal formated_intro("\n", root_path), ""
    assert_equal formated_intro("", root_path), ""
    assert_equal formated_intro(nil, root_path), ""
    assert_equal formated_intro("This is a test intro.", nil), "<p>This is a test intro...#{link_to "(view more)", "#"}</p>"
  end

  test "formated body" do
    assert_equal formated_body("This is a test intro."), "<p>This is a test intro.</p>"
    assert_equal formated_body("This is a test intro.\nIt has multiple lines."), "<p>This is a test intro.</p><p>It has multiple lines.</p>"
    assert_equal formated_body("This is a test intro!\nIt has multiple lines."), "<p>This is a test intro!</p><p>It has multiple lines.</p>"
    assert_equal formated_body("1"), "<p>1</p>"
    assert_equal formated_body("\n"), ""
    assert_equal formated_body(""), ""
    assert_equal formated_body(nil), ""
  end
end
