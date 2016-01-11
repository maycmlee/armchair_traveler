class CountryController < ApplicationController

  def create
    @country_name = params[:country][:name]
    country = Country.new(@country_name)
    @map = country.get_static_map
    # @googlemap = country.get_google_map
    @photo_urls = country.get_photos_url
    @video_urls = country.get_videos_url
  end
end
