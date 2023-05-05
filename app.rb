require 'sinatra/base'
require 'sinatra/reloader'

class Application < Sinatra::Base

    configure :development do
        register Sinatra::Reloader
      end
    
    get '/' do
        @greeting = params[:greeting]

        return erb(:index)
    end
    
    get '/hello' do
        @name = params[:name]

        return erb(:hello)
    end
       
    get '/names' do
        @names = params[:names]

        return "#{@names}"
    end

    post '/sort-names' do
        names = params[:names]

        return "#{names.split(",").sort.join(",")}"
    end
end

# Incoming request: GET /todos/1 # sinatra will look through the different options below 
                                 #to see which one to run

# Routes 

# GET /     -> execute some code

# GET /todos/1 -> execute some different piece of code

# POST /todos  -> execute some different code