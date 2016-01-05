module Adapters
  class FlickrSearch
    attr_accessor :search_term

    def initialize(search_term)
      @search_term = search_term
      @flickr = Flickr.new(File.join(Rails.root, 'config', 'flickr.yml')) 
    end

    def get_photos_url
      flickr_photos = self.query
      flickr_photos.map.with_index do |photo, index|
        Photo.new(photo, index).url_small
      end
    end

    def query
      @flickr.photos.search(text: "#{self.search_term} landscape", tags: "#{self.search_term}", content_type: 1, per_page: 8, license: 6)
    end
  end
end