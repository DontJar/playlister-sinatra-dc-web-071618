require 'pry'

module Slugify

  module InstanceMethods
    def slug
      binding.pry
      self.name.downcase.strip.gsub(' ', '-').gsub(/[^\w-]/, '')
    end
  end

  module ClassMethods
    def find_by_slug(slug)
      # self.all.find do |x|
      self.all.select do |x|
        # binding.pry
        x.slug == slug
      end[0]
    end
  end

end
