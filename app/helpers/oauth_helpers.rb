class Five
  module OauthHelpers
    def oauth_consumer
      @oauth_consumer ||= OAuth::Consumer.new(Five.settings.twitter_key, Five.settings.twitter_secret, site: "http://api.twitter.com")
    end

    def client
      Twitter.configure do |config|
        config.consumer_key = Five.settings.twitter_key
        config.consumer_secret = Five.settings.twitter_secret
        config.oauth_token = session[:access_token]
        config.oauth_token_secret = session[:access_secret]
      end
      @client ||= Twitter::Client.new
    end
  end

  helpers OauthHelpers
end