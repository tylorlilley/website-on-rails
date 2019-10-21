module PostsHelper

  # Returns the formatted post date
  def formated_date_for(post)
    return "" if post.nil?
    formated_date(post.date)
  end

  # Returns the combined post date and title for the given post
  def formated_title_for(post)
    return formated_date_for(post) if post.nil? || post.title.nil?
    "#{formated_date_for(post)} - #{post.title}"
  end

  # Returns the first section of a post's content
  def formated_intro_for(post)
    return "" if post.nil?
    formated_intro(post.content)
  end

  # Returns the body of the post formatted with HTML tags
  def formated_body_for(post)
    return "" if post.nil?
    formated_body(post.content)
  end

end
