require 'twitter'
  require 'dotenv'

def return_client_object()
  Dotenv.load('.env') 
client = Twitter::REST::Client.new do |config|
  config.consumer_key        = ENV["TWITTER_CONSUMER_KEY"]
  config.consumer_secret     = ENV["TWITTER_CONSUMER_SECRET"]
  config.access_token        = ENV["TWITTER_ACCESS_TOKEN"]
  config.access_token_secret = ENV["TWITTER_ACCESS_TOKEN_SECRET"]
end
return client
end
client = return_client_object
 
def select_20_tweets(client)
  client.search("\#bonjour_monde").take(20).collect {|tweet| tweet.id}
end

def like_bonjour_monde(select_20_tweets, client)
  select_25_tweets.each do |tweet|
  client.follow(tweet.user.id)
  end
end

like_bonjour_monde(select_20_tweets(client), client)
