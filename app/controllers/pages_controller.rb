class PagesController < ApplicationController
  def home
    # makes sure this isn't the first time you are getting tweets
    if Tweet.last.created_at.nil?
      tweets = Tweet.new
      tweets.get_tweets "#NBA"
    else
      last_tweet = Tweet.last.created_at 
    end
    
    last_tweet = Tweet.last.created_at 
    tweets = Tweet.new
    topics = %w(#NBA BleacherReport ESPNNBA)
    tweets.get_tweets topics.sample if Time.now.utc - last_tweet > 600 # 10 mins
    @tweets = Tweet.last(15)
    
    
    last_news_search = News.last.created_at
    news = News.new
    news.get_news if Time.now - last_news_search > 7200 # 2 hours
    @news = News.last(17)
  end
end
