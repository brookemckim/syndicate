require 'sinatra/base'
require 'lib/video'
require 'builder'

module Syndicate
  class App < Sinatra::Base
    
    helpers do
      def url_from_path(path)
        URI.encode "http://#{request.host}:#{request.port}/v#{path}"
      end  
    end  
    
    get '/d/*' do
      directory = File.join('/', params[:splat][0], '*')
          
      files   = Dir[directory].select { |file| !File.directory? file }      
      @videos = files.map { |file| Video.from_path(file) } 
      
      builder :mrss
    end
    
    get '/v/*' do
      path = File.join('/', URI.decode(params[:splat][0]))
      
      send_file path
    end    
  end  
end
  