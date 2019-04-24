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
  
  ### This makes the score api request
  def get_scores
    api = Rails.application.secrets.live_scores_api
    date = (DateTime.now.utc - 1).strftime("%Y-%m-%d")
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
  
  
  # this just makes sure we are doing it once a day only and getting images also
  def scores_nav
    if Score.any? == false
      get_scores
    else
      last_game_update = Score.last.created_at.utc
      get_scores if Time.now > Time.parse("#{Date.today} 16:00") && last_game_update + 86400 < Time.now.utc
    end
    
    
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
  

end
