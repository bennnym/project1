class PagesController < ApplicationController
  def home
    last_tweet = Tweet.last.created_at
    last_news_search = News.last.created_at

    get_tweets if Time.now - last_tweet > 600 # 10 mins
    
    @tweets = Tweet.last(10)
    get_news if Time.now - last_news_search > 43200 # 12 hours
    @news = News.last(10)
  
  end
end
