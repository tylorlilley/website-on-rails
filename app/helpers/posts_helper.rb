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
    formated_intro(content_for(post), post)
  end

  # Returns the body of the post formatted with HTML tags
  def formated_body_for(post)
    return "" if post.nil?
    formated_body(content_for(post))
  end

  # Returns the contents of the post's associated content file
  def content_for(post)
    File.read("app/views/posts/content/_#{post.slug}.html.haml")
  end

  # Returns the path of the associated image file
  def image_for(post, number=1)
    asset_path("posts/#{post.slug}-#{number.to_s}.png")
  end

end
