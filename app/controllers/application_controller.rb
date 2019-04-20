class ApplicationController < ActionController::Base
  before_action :fetch_user #first action the server will take

  private
  def fetch_user
    @current_user = User.find_by :id => session[:user_id] if session[:user_id].present?
    session[:user_id] = nil unless @current_user.present?
  end

  private
  def check_for_login
    redirect_to login_path unless @current_user.present?
  end
  
  def get_tweets
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
  
  def get_scores
    api = '258c806c6c36002827874f0a7bd6f248538eaed3c08eabae8a3dcdf02684f903'
    date = (DateTime.now - 1).strftime("%Y-%m-%d")
    url = "https://allsportsapi.com/api/basketball/?met=Fixtures&APIkey=#{ api }&from=#{ date }&to=#{ date }&leagueId=787"
    info = HTTParty.get url
    games = info["result"]
    
    games.each do |game|
      score = Score.new
      puts score.home_team = game["event_home_team"]
      puts score.home_score = game["event_final_result"].first(3)
      puts score.away_team = game["event_away_team"]
      puts score.away_score = game["event_final_result"].last(3)
      score.save
      @time = Time.now()
    end
  end
  

end
