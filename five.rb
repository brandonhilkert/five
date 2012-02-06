require 'bundler'
Bundler.require

class Five < Sinatra::Base
  enable   :raise_errors, :sessions, :logging
  enable   :show_exceptions  if development?
end

['config/initializers', :models, :controllers, :routes].each do |dir|
  Dir.glob("#{dir}/*.rb").each do |rb|
    # puts "loading #{rb}"
    require_relative rb
  end
end