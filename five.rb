ENV['RACK_ENV'] ||= 'development'

# Bundler
require 'bundler'
Bundler.require :default, ENV['RACK_ENV'].to_sym

class Five < Sinatra::Base
  enable   :raise_errors, :sessions, :logging
  enable   :show_exceptions  if development?

  

  not_found {haml :'404'}
  error {haml :'500'}

  get '/' do
    haml :index
  end
end

# Load MongoMapper
require './config/mongo.rb'

# Load models
Dir['./models/*.rb'].each { |model| require model }