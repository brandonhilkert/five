require File.join(File.dirname(__FILE__), '..', 'five.rb')

require 'rubygems'
require 'sinatra'
require 'rack/test'
require 'rspec'

set :environment, :test

Rspec.configure do |config|
  config.after(:each) do

    # Clear out MongoDB before each test
    MongoMapper.database.collections.each do |collection|
      collection.remove unless collection.name.match(/^system\./)
    end

  end
end