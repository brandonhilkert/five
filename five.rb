require 'bundler'
Bundler.require

class Five < Sinatra::Base
  enable  :raise_errors, :sessions, :logging
  enable  :show_exceptions if development?
  enable  :method_override
  set :session_secret, "alksdjf;laspd98fyapsihwjk3r"

  set :public_folder, File.join(root, "app", "assets")
  set :views, File.join(root, "app", "views")
  # set :views, File.join(File.dirname(__FILE__), "app", "assets")
  # set :views, Proc.new { File.join(root, "app/views") }

  configure do
    # Load MongoDB using MongoMapper
    mongo_config = ::Pathname.new(File.join(root, "config", "mongo.yml"))

    if mongo_config.file?
      config = ::YAML.load(ERB.new(mongo_config.read).result)
      log = ::Logger.new(File.join(root, "log", "mongo-#{settings.environment}.log"))
      ::MongoMapper.setup(config, settings.environment.to_s, logger: log)
    end

    twitter_config_file = ::Pathname.new(File.join(root, "config", "twitter.yml"))
    twitter_config = ::YAML.load(ERB.new(twitter_config_file.read).result)
    set :twitter_key, twitter_config[settings.environment.to_s]["key"]
    set :twitter_secret, twitter_config[settings.environment.to_s]["secret"]
  end
  
end

Dir[Pathname.new("app/**/*.rb")].each {|f| require_relative f}
