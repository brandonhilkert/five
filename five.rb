require 'sinatra/base'
require 'mongo_mapper'

class Five < Sinatra::Base

  configure do
    set :sessions, true

    # Load MongoDB using MongoMapper
    config_file = ::Pathname.new(File.join(root, "config", "mongo.yml"))

    if config_file.file?
      config = YAML.load(ERB.new(config_file.read).result)
      log = ::Logger.new(File.join(root, "log", "mongo-#{settings.environment}.log"))
      ::MongoMapper.setup(config, settings.environment, logger: log)
    end
  end

  Dir['models/*.rb'].each { |model| require model }

  get '/' do
    haml :index
  end
end