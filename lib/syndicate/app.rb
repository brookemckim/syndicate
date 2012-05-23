require 'sinatra/base'
require 'builder'
require 'puma'

APP_ROOT ||= File.expand_path( File.dirname(__FILE__) )
require APP_ROOT + '/lib/video'

module Syndicate
  class App < Sinatra::Base
    
    set :server, :puma
    set :port, 3000
    
    helpers do
      def url_from_path(path)
        URI.encode "http://#{request.host}:#{request.port}/v#{path}"
      end  
    end  
    
    get '/' do
      "Syndicate : MRSS Publishing"
    end  
    
    get '/d/*' do
      @directory = File.join('/', params[:splat][0], '*')
          
      files   = Dir[@directory].select { |file| !File.directory? file }      
      @videos = files.map { |file| Video.from_path(file) }.compact
      
      builder :mrss
    end
    
    get '/v/*' do
      path = File.join('/', URI.decode(params[:splat][0]))
      
      send_file path
    end    
  end  
end
  