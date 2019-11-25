module ApplicationHelper

  # Render the given svg image
  def svg(name)
    file_path = "#{Rails.root}/app/assets/images/svg/#{name}.svg"
    return File.read(file_path).html_safe if File.exists?(file_path)
    '(not found)'
  end
  
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
  def formated_intro(content, link_destination)
    return "" if content.blank? || content.split("\n").first.blank?
    link_destination ||= "#"
    tag.p raw "#{content.split("\n").first[0...-1]}...#{link_to "(view more)", link_destination}"
  end

  # Returns a block of content formated into a paragraph
  def formated_body(content)
    return "" if content.blank? || content.split("\n").first.blank?
    body = ""
    content.split("\n").each do |paragraph|
      body += tag.p raw paragraph
    end
    body
  end

end
