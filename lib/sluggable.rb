module Sluggable
  module Finder
    # Finds a record using the given id.
    #
    # If the id is "unslug", it will call the original find method.
    # If the id is a numeric string like '123' it will first look for a slug
    # id matching '123' and then fall back to looking for a record with the
    # numeric id '123'.
    #
    # if the id is a numeric string like '123-foo' it
    # will only search by slug id and not fall back to the regular find method.
    #
    # @raise ActiveRecord::RecordNotFound
    def find(*args)
      id = args.first
      return super if args.count != 1 || unslug?(id)
      resource = resource_by_slug(id)
      resource ? resource : super
    end

    private

    def resource_by_slug(id)
      resource = find_by(slug: id)
      raise ActiveRecord::RecordNotFound unless resource
      resource
    end

    # True if the id is definitely slug, false if definitely unslug
    #
    # An object is considered "definitely unslug" if its class is or
    # inherits from ActiveRecord::Base, Array, Hash, NilClass, Numeric, or
    # Symbol.
    #
    # An object is considered "definitely slug" if it responds to +to_i+,
    # and its value when cast to an integer and then back to a string is
    # different from its value when merely cast to a string:
    #
    #     slug?(123)          => false
    #     slug?("123")        => false
    #     slug?("abc123")     => true
    def slug?(arg)
      false if Integer(arg)
    rescue ArgumentError, TypeError
      true
    end

    def unslug?(arg)
      !slug?(arg)
    end
  end
end
