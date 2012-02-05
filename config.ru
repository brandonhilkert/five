require "rubygems"
require "bundler"
Bundler.require

# ENV["RACK_ENV"] ||= "development"
# FiveConfig = YAML.load_file(File.join(File.dirname(__FILE__), "config", "config.yml"))[ENV["RACK_ENV"]]
# ENV["MONGO_URI"] ||= ENV["MONGO_URI"] || FiveConfig["mongo_uri"]

Bundler.require(:default, ENV['RACK_ENV'].to_sym)

require './five'
run Five