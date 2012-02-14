class Five
  module OauthHelpers
    def oauth_consumer
      @oauth_consumer ||= TwitterOAuth::Client.new(consumer_key: Five.settings.twitter_key, consumer_secret: Five.settings.twitter_secret)
    end
  end

  helpers OauthHelpers
end