class TwitterStream
  include SuckerPunch::Job

  def perform
    @client = Twitter::Streaming::Client.new do |config|
      config.consumer_key        = "DhkoBy7s7sKmw41Iw3qpiDehW"
      config.consumer_secret     = "JB7orkLsNfBZyO6PJsKtJV4CAJfBTqX11fjSmhxUF9qT6oLL5k"
      config.access_token        = "846470594-bDmJig5wKkznv7MblbKT0MQBtzWQjjLXEO6th53k"
      config.access_token_secret = "ZRvLp3c8tT7A4GwU7yOuV89KTMmP4GYpli236cpySkacN"
    end

    @client.filter(track: 'Secret') do |object|
      if object.kind_of? Twitter::Tweet
        puts "sending tweet #{object.text}"
        WebsocketRails[:tweets].trigger(:new_tweet, { message: object.text + '<br>' })
      end
    end

    all_tweets = []

    client.filter(track: 'secret') do |tweet|
      if tweet.kind_of? Twitter::Tweet
        puts tweet.text
        all_tweets.push tweet
      end
    end
  end
  
end