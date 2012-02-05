require 'sinatra/base'

class Five < Sinatra::Base
  get '/' do
    haml :index
  end
end