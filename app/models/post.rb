class Post < ApplicationRecord
  before_create :set_slug_to_default

  def to_param
    return nil unless persisted?
    slug
  end

  def self.sluggable
    all.extending(Sluggable::Finder)
  end

  def previous
    Post.where('date < ?', date).order(date: :desc).limit(1).first
  end

  def next
    Post.where('date > ?', date).order(date: :asc).limit(1).first
  end

  private

  def set_slug_to_default
    self.slug = "#{self.date.to_s&.parameterize}-#{self.title&.parameterize}"
  end
end
