class User
  include MongoMapper::Document
  
  key :name,                String
  key :screen_name,         String
  key :wants,               Array

  def self.process_login(twitter_response)
    if user = self.first(screen_name: twitter_response["screen_name"])
      user
    else
      User.create(name: twitter_response["name"], screen_name: twitter_response["screen_name"])
    end
  end

end