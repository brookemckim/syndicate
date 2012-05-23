require 'uri'

class Video
  attr_reader :title, :description, :thumbnail, :path
  
  VALID_EXTENSIONS = ['.mp4', '.avi', '.mkv']
  
  def self.from_path(path)
    if valid_extension? path    
      title = path.split('/').last
      title = strip_extension(title)
    
      Video.new(
        title: title,
        path:  path
      )
    end  
  end
  
  def initialize(args = {})
    @title = args[:title]
    @path  = args[:path]
  end    
  
  private
  
  def self.strip_extension(path)
    segments = path.split('.')
    segments.delete_at(-1)
    segments.join('.')
  end
  
  def self.valid_extension?(path)
    VALID_EXTENSIONS.include? File.extname(path).downcase
  end    
end
  