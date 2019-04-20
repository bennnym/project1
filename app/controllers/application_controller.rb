class ApplicationController < ActionController::Base
  before_action :fetch_user, :scores_nav #first action the server will take

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
  client.search("ESPNNBA -rt", options = {lang: "en", result_type: "mixed"} ).take(10).each do |tweets|
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
    end
  end
  
  def scores_nav
    last_game_update = (Score.last.created_at + Time.now.utc_offset).strftime("%Y-%m-%d")
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
  end
  
  def get_news
    api = '50c50a7fed8e419aa10443c203e72c7c'
    url = "https://newsapi.org/v2/everything?language=en&q=NBA&from=#{ DateTime.now.strftime("%Y-%m-%d")}&sortBy=popularity&apiKey=#{ api }"
    
    info = HTTParty.get url
    
    articles = info["articles"].first(20)
    
    articles.each do |news|
      db_news = News.new
      db_news.source = news["source"]["name"]
      db_news.title = news["title"]
      db_news.description = news["description"]
      db_news.url = news["url"]
      db_news.image = news["urlToImage"]
      db_news.content = news["content"]
      team_name = team_id_locator(db_news.content)
      if team_name.empty?
        db_news.team_id = 1
      else
        db_news.team_id = Team.where("name like ?", "%#{team_name}%").first.id
      end
      db_news.save
    end
  end
    
    
    def team_id_locator string
      
      team_list = %w(Hawks 
      Celtics 
      Nets
      Bobcats 
      Bulls 
      Cavaliers 
      Mavericks 
      Nuggets 
      Pistons 
      Warriors 
      Rockets 
      Pacers 
      Clippers 
      Lakers 
      Grizzlies 
      Heat 
      Bucks 
      Timberwolves 
      Hornets 
      Knicks 
      Thunder 
      Magic 
      76ers 
      Suns 
      Blazers 
      Kings 
      Spurs 
      Raptors 
      Jazz 
      Wizards)

      team_list.select do |team| 
        return team if string.split.count(team) > 0 
      end
    end
    

end
