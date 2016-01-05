module Adapters
  class YoutubeSearch
    attr_accessor :search_term, :client, :video_search_JSON

    DEVELOPER_KEY = File.read("youtube.yml")

    def initialize(search_term)
      @search_term = search_term
      @client = Google::APIClient.new(
      :key => DEVELOPER_KEY,
      :authorization => nil,
      :application_name => $PROGRAM_NAME,
      :application_version => '1.0.0'
      )
    end

    def get_videos_url
      videos = self.query
      videos["items"].map do |video|
        Video.new(video["id"]["videoId"]).url
      end
    end

    def query
      youtube = @client.discovered_api('youtube', 'v3')
      video_search = @client.execute :api_method => youtube.search.list, :parameters => {q: "#{self.search_term} travel guide", part: 'id', type: 'video', chart: "mostPopular"}
      JSON.parse(video_search.data.to_json)
    end
  end
end