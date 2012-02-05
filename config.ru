require './five'

Five.set :run, false
logger = ::File.open("log/#{settings.environment}.log", "a+")
Five.use Rack::CommonLogger, logger
run Five