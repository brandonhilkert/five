ENV['RACK_ENV'] ||= 'development'

# Bundler
require 'bundler'
Bundler.require :default, ENV['RACK_ENV'].to_sym

class Five < Sinatra::Base
  enable   :raise_errors, :sessions, :logging
  enable   :show_exceptions  if development?
end

['config/initializers', 'models', 'controllers', 'routes'].each do |dir|
  Dir.glob("#{dir}/*.rb").each do |rb|
    puts "loading #{rb}"
    require_relative rb
  end
end