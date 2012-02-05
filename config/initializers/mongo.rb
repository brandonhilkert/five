require 'mongo_mapper'

class Five
  configure do
    # Load MongoDB using MongoMapper
    config_file = ::Pathname.new(File.join(root, "config", "mongo.yml"))

    if config_file.file?
      config = YAML.load(ERB.new(config_file.read).result)
      log = ::Logger.new(File.join(root, "log", "mongo-#{settings.environment}.log"))
      ::MongoMapper.setup(config, settings.environment.to_s, logger: log)
    end
  end
end