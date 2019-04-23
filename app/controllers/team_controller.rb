class TeamController < ApplicationController
  before_action :check_for_login
  
  def show
    @team = Team.find_by :id => session[:team_id]
    @followed_players = @current_user.players
  end
  
  def edit
    @team = Team.find_by :id => session[:team_id]
    
    player = Player.find_by :last_name => params[:name]
    @current_user.players << player
    
    
    
    render :show  
  end
  
end
