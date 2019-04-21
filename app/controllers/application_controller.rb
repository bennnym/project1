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
  
  
  def get_scores
    api = '258c806c6c36002827874f0a7bd6f248538eaed3c08eabae8a3dcdf02684f903'
    date = (DateTime.now - 2).strftime("%Y-%m-%d")
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
  

end
