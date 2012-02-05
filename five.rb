ENV['RACK_ENV'] ||= 'development'

# Bundler
require 'bundler'
Bundler.require :default, ENV['RACK_ENV'].to_sym

class Five < Sinatra::Base
  enable   :raise_errors, :sessions, :logging
  enable   :show_exceptions  if development?
end

# Load initializers
Dir['config/initializers/*.rb'].each { |rb| require_relative rb }

# Load models
Dir['models/*.rb'].each { |rb| require_relative rb }

# Load helpers
Dir['helpers/*.rb'].each { |rb| require_relative rb }

# Load routes
Dir['routes/*.rb'].each { |rb| require_relative rb }


