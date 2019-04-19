class PagesController < ApplicationController
  def home
    last_tweet = Tweet.last.created_at
    
    #only update if longer than 10 mins this helps with daylight savings
    
    ## TO DO  - optimize this somehow - maybe make it run in the background not on every load?
    get_tweets if Time.now - last_tweet > 600
      
    api = '258c806c6c36002827874f0a7bd6f248538eaed3c08eabae8a3dcdf02684f903'
    date = (DateTime.now - 1).strftime("%Y-%m-%d")
    url = "https://allsportsapi.com/api/basketball/?met=Fixtures&APIkey=#{ api }&from=#{ date }&to=#{ date }&leagueId=787"
    info = HTTParty.get url
    @games = info["result"]
    @tweets = Tweet.last(5)
  end
end
