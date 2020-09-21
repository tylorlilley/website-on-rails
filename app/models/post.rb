class Post < ApplicationRecord
  before_create :set_slug_to_default

  def to_param
    return nil unless persisted?
    slug
  end

  def self.sluggable
    all.extending(Sluggable::Finder)
  end

  private

  def set_slug_to_default
    self.slug = self.title&.parameterize
  end
end
