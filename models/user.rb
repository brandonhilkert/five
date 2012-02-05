class User
  include MongoMapper::Document
  
  key :first_name,                String
  key :last_name,                 String
  key :twitter_id,                String
  key :twitter_username,          String
  key :twitter_token,             String
  key :twitter_secret,            String
  key :twitter_following,         Array
end