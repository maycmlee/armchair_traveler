class Video
  attr_reader :video_id

  def initialize(video_id)
    @video_id = video_id
  end

  def url
    "https://www.youtube.com/embed/#{self.video_id}"
  end
end
