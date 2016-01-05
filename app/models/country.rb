class Country 
  attr_accessor :country_name
  
  def initialize(country_name)
    @country_name = country_name
  end
  
  DEVELOPER_KEY = File.read('googlemap.yml')
  
  def get_map
    "https://maps.googleapis.com/maps/api/staticmap?center=#{self.country_name}&zoom=4&size=250x250&key=#{DEVELOPER_KEY}"
  end

  def get_photos_url
    Adapters::FlickrSearch.new(self.country_name).get_photos_url
  end

  def get_videos_url
    Adapters::YoutubeSearch.new(self.country_name).get_videos_url
  end
end
