begin
  require "sinatra/base" 
rescue LoadError
  puts "Could not load 'sinatra'"
  put "run 'gem install sinatra'"
  exit
end

module Entityjs
  
  class Server < Sinatra::Base
    
    def self.run(args)
      
      if !Dirc.game?
        return 2
      end
      
      set :public_folder, Dirc.game_root
      
      Entityjs::Server.run! :port=>2345
    end
    
    get '/' do
      
      Assets.set_vars(IO.read("#{Entityjs::root}/public/play.html"))
      
    end
    
    get '/tests' do
      
      Assets.set_vars(IO.read("#{Entityjs::root}/public/tests.html"), true)
      
    end
    
    get '/entityjs/*' do
      content_type 'text/javascript'
      IO.read(Entityjs::root+'/src/'+params[:splat].first)
    end
    
    get '/qunit/qunit.js' do
      content_type 'text/javascript'
      IO.read(Entityjs::root+'/public/qunit.js')
    end
    
    get '/qunit/qunit.css' do
      content_type 'text/css'
      IO.read(Entityjs::root+'/public/qunit.css')
    end
    
  end
  
end