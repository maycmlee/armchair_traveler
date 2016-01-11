require 'open-uri'

module Adapters
  class GoogleMap
    attr_accessor :country_name, :json_coords
    def initialize(country_name)
      @country_name = country_name
    end

    DEVELOPER_KEY = File.read('googlemap.yml')
    
    def get_map
      get_lat_long_coords
    end

    def get_lat_long_coords
      url = "https://maps.googleapis.com/maps/api/geocode/json?address=#{self.country_name}&key=#{DEVELOPER_KEY}"
      json_coords = open(url).read
      binding.pry
    end
  end
end
