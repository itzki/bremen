require 'bremen/author'

module Bremen
  module Track
    attr_accessor :uid, :url, :title, :author, :thumbnail_url, :length, :created_at, :updated_at

    def initialize attrs = {}
      attrs.each do |key, value|
        send("#{key}=", value) if respond_to?(key)
      end
    end
  end
end
