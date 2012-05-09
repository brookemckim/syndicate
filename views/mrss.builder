xml.instruct! :rss, :version => '2.0', :'xmlns:media' => 'http://search.yahoo.com/mrss/'

xml.channel do
  xml.title "hi"
  xml.link "http://localhost:9393"
  xml.description ""
  
  @videos.each do |v|
    xml.item do
      xml.media :title, v.title
      xml.media :description, v.description
      xml.media :thumbnail, v.thumbnail
      xml.content( medium: 'video', url: url_from_path(v.path) )
    end  
  end  
end    
