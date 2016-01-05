class Photo

attr_accessor :flickr_data, :id

  def initialize(flickr_data, id)
    @flickr_data = flickr_data
    @id = id
  end

  def url_small
    self.flickr_data.url(:small)
  end

  def url_large
    self.flickr_data.url(:large)
  end

  def url_medium
    self.flickr_data.url(:medium)
  end

  # def download
  #   Dir.mkdir("images") unless File.exist?("images")
  #   open(self.photo_flickr.url) {|f|
  #     File.open(self.photo_path,"wb") do |file|
  #         file.puts f.read
  #       end
  #     }
  # end

  # def resize
  #   image = Magick::Image.read(self.photo_path)[0]
  #   resize = image.resize_to_fill(200, 100)
  #   resize.write(self.photo_path)
  # end

  # def photo_path
  #   "images/img_#{self.photo_flickr.id}.jpg"
  # end

end
