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
 
def follow_20_bonjour_monde(client)
  results = client.search("#bonjour_monde", result_type: "recent").take(20)
  results.each do |tweet|
  client.follow(:screen_name => tweet.user.screen_name)
  end
end

follow_bonjour_monde(client)

#Trop de requetes avec l'api, bloqué par twitter...

