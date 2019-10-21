module ApplicationHelper

  # Returns the full title on a per-page basis.
  def full_title(page_title = '')
    base_title = "Tylor Lilley"
    if page_title.empty?
      base_title
    else
      page_title + " | " + base_title
    end
  end

  # Returns a nicely formated version of a given date
  def formated_date(date)
    return "" if date.nil?
    "#{date.strftime("%B #{date.day.ordinalize}, %Y")}"
  end

  # Returns the first section of a block of content formated into a paragraph
  def formated_intro(content)
    return "" if content.blank? || content.split("\n").first.blank?
    sanitize tag.p "#{content.split("\n").first[0...-1]}..."
  end

  # Returns a block of content formated into a paragraph
  def formated_body(content)
    return "" if content.blank? || content.split("\n").first.blank?
    body = ""
    content.split("\n").each do |paragraph|
      body += tag.p paragraph
    end
    sanitize body
  end

end
