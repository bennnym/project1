class PagesController < ApplicationController
  def home
    last_tweet = Tweet.last.created_at
    last_news_search = News.last.created_at
    tweets = Tweet.new
    news = News.new
    tweets.get_tweets "#NBA" if Time.now.utc - last_tweet > 600 # 10 mins
    news.get_news if Time.now - last_news_search > 7200 # 2 hours
    @tweets = Tweet.last(15)
    @news = News.last(17)
  
  end
end
