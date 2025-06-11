require 'json'
require 'date'
require 'fileutils'

class InstagramPost
    def initialize(file_data)
        @description = file_data[:description]
        @photo_file_path = file_data[:photo_file_path]
        @post_date = file_data[:post_date]
    end

    attr_reader :description, :photo_file_path, :post_date

    def convert_to_post
        description_paragraphs = description.split("\n\n")
        intro = description_paragraphs.shift

        content = """
- unless intro
    .container.post-image
        .row
        .col-12
            = image_tag(image_for(@post), alt: \"An image originally posted to Instagram on #{post_date}\")

%p
  #{intro}

- unless intro
"""

        description_paragraphs.each do |paragraph|
            lines = paragraph.split('#')
            first_line = lines.shift
            content << "  %p"
            content << "\n    #{first_line}" unless first_line.nil? or first_line == ''
            lines.each do |line|
                content << "\n    .hashtag #{line}"
            end
        end

        file_prefix = photo_file_path.split('.').last
        FileUtils.copy photo_file_path, "./converted_images/_#{post_date}-instagram.#{file_prefix}"

        output_file = File.new("./converted_posts/_#{post_date}-instagram.html.haml", "w")
        output_file.write(content)
        output_file.close
    end
end

class InstagramPostConverter
    def translate_file(file_name)
        file_path = "./your_instagram_activity/media/#{file_name}"
        return unless File.exist?(file_path)
        file_data = File.read(file_path)

        if file_name == "profile_photos.json"
            #translate_profile(file_data)
        else
            translate_posts(file_data)
        end
    end

    def translate_posts(file_data)
        JSON.parse(file_data).each do |post_data| 
            translate_post(post_data["media"].first)
        end
    end

    def translate_post(post_data)
        InstagramPost.new({
            description: post_data["title"],
            photo_file_path: post_data["uri"],
            post_date: Time.at(post_data["creation_timestamp"]).to_date
        }).convert_to_post
    end
end

file_names = Dir.entries("./your_instagram_activity/media")
converter = InstagramPostConverter.new

file_names.each do |file_name|
    converter.translate_file(file_name) unless file_name == "." or file_name == '..'
end
