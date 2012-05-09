require 'uri'

class Video
  attr_reader :title, :description, :thumbnail, :path
  
  def self.from_path(path)
    title = path.split('/').last
    
    Video.new(
      title: title,
      path:  path
    )
  end
  
  # TODO: Move this elsewhere.
  def self.url_from_video_path(path)  
    URI.encode("http://localhost:9393/v#{path}")
  end  
  
  def initialize(args = {})
    @title = args[:title]
    @path  = args[:path]
  end    
end
  