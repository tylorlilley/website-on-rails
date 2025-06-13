module ApplicationHelper

  # Render the given svg image
  def svg(name, opts = {})
    opts[:width] ||= 24
    opts[:height] ||= 24

    ("<svg xmlns=\"http://www.w3.org/2000/svg\" width=\"#{opts[:width]}\" height=\"#{opts[:height]}\" viewBox=\"0 0 8 8\">\n\t" +
    svg_file_path(name) +
    "\n</svg>").html_safe
  end

  def svg_file_path(name)
    file_path = "#{Rails.root}/app/assets/images/svg/#{name}.svg"
    return File.read(file_path).html_safe if File.exist?(file_path)
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
    return "" if content.blank? || content.split("%p\n").second.blank?
    link_destination ||= "#"
    appended_link = "... #{link_to "(view more)", link_destination}"
    intro = content.split("%p\n").second[0...-2] + appended_link
    begin
      Haml::Engine.new( "%p\n"+intro ).render(self)
    rescue Haml::SyntaxError
      Haml::Engine.new("%p\nNo introductory text found"+ appended_link).render(self)
    end
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
