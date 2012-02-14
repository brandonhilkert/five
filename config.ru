require './five'

require 'logger'
logger = File.join(Five.root, 'log', "#{Five.settings.environment.to_s}.log")
# class ::Logger; alias_method :write, :<<; end
# Five.use Rack::CommonLogger, ::Logger.new(logger)

run Five