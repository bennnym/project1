class PagesController < ApplicationController
  def home
    last_tweet = Tweet.last.created_at
    last_game_update = (Score.last.created_at + Time.now.utc_offset).strftime("%Y-%m-%d")

    
    #only update if longer than 10 mins this helps with daylight savings
    
    ## TO DO  - optimize this somehow - maybe make it run in the background not on every load?
    get_tweets if Time.now - last_tweet > 600
    
    ## TO DO - work out a way to not load scores everytime 
    
    get_scores if Time.now.strftime("%Y-%m-%d") != last_game_update
    @images = []
    @games = Score.last(3)
    @games.each do |game|
      away = game.away_team.split(' ').last
      away_img = Team.where("name like ?", "%#{ away }%").first.logo
      home = game.home_team.split(' ').last
      home_img = Team.where("name like ?", "%#{ home }%").first.logo
      @images.push([home_img, away_img])
    end
    @tweets = Tweet.last(5)
  end
end
