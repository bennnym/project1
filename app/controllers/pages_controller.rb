class PagesController < ApplicationController
  def home
    last_tweet = Tweet.last.created_at
    
    #only update if longer than 10 mins this helps with daylight savings
    if Time.now - last_tweet > 600 
      
        client = Twitter::REST::Client.new do |config|
        config.consumer_key        = "XmTytXBvoo53wQkH1PgeggvEM"
        config.consumer_secret     = "5emA8hVXTerecNr3FCF9rEBX4Jb1WTxfyWV0Zm3ww5UKdP70Rc"
        config.access_token        = "912455494710714368-rHTelxjTlJfxmqzkA23tFdma1TRenBQ"
        config.access_token_secret = "k16jtF2uwOgb6mnX3f2Ssm6ZQoIhSVTBjCnpy1D0a0mzY"
      end
      
      # see https://www.rubydoc.info/gems/twitter/Twitter/REST/Search
      client.search("#nba -rt", options = {lang: "en", result_type: "mixed"} ).take(10).each do |tweets|
         twitter_post = Tweet.new
         twitter_post.tweet = tweets.full_text
         twitter_post.favorite = tweets.favorite_count
         twitter_post.language = tweets.lang
         twitter_post.retweet_count = tweets.retweet_count
         twitter_post.url = tweets.url
         #embed the link for display on the site
         url = "https://publish.twitter.com/oembed?url=#{ tweets.url }"
         info = HTTParty.get url
         twitter_post.embed = info["html"]
         twitter_post.save
       end
      
    end
     @tweets = Tweet.last(5)
  end
end
