# file: app.rb
require 'sinatra/base'
require 'sinatra/reloader'

class Application < Sinatra::Base
  # This allows the app code to refresh
  # without having to restart the server.
  configure :development do
    register Sinatra::Reloader
  end

  # Declares a route that responds to a request with:
  #  - a GET method
  #  - the path /
  get '/' do
    # The code here is executed when a request is received and we need to 
    # send a response. 

    # We can return a string which will be used as the response content.
    # Unless specified, the response status code will be 200 (OK).
    return 'Some response data'
  end
  get '/hello' do
    @name = params[:name]

    return erb(:index)
  end
  post '/submit' do
    name = params[:name]
    message = params[:message]

    return "Thanks #{name}, you sent this message: #{message}"
  end
  get '/names' do
    names = params[:names] 
    return "#{names}"
  end
  post '/sort-names' do
    names = params[:names] 
    split_names = names.split(',')
    sorted_names = split_names.sort
    return "#{sorted_names.join(',')}"
  end
end