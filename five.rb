require 'bundler'
Bundler.require

class Five < Sinatra::Base
  enable   :raise_errors, :sessions, :logging
  enable   :show_exceptions if development?

  set :public_folder, File.join(root, "app", "assets")
  set :views, File.join(root, "app", "views")
  # set :views, File.join(File.dirname(__FILE__), "app", "assets")
  # set :views, Proc.new { File.join(root, "app/views") }

  configure do
    # Load MongoDB using MongoMapper
    config_file = ::Pathname.new(File.join(root, "config", "mongo.yml"))

    if config_file.file?
      config = ::YAML.load(ERB.new(config_file.read).result)
      log = ::Logger.new(File.join(root, "log", "mongo-#{settings.environment}.log"))
      ::MongoMapper.setup(config, settings.environment.to_s, logger: log)
    end
  end
end

Dir[Pathname.new("app/**/*.rb")].each {|f| require_relative f}
