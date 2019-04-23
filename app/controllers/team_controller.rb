class TeamController < ApplicationController
  before_action :check_for_login
  
  def show
    @team = Team.find_by :id => session[:team_id]
    @followed_players = @current_user.players
  end
  
  def edit
    @team = Team.find_by :id => session[:team_id]
    
    if params[:name].split(' ').length == 1 || params[:name].empty?
      return redirect_to team_path
    end
        
    name = Team.new
    name = name.validate_player params[:name] #returns a hash with first and last names stored
    
    player = Player.find_by :last_name => name[:last_n], :first_name => name[:first_n]
    
    return redirect_to team_path if player.nil?
    
    @current_user.players << player
    render :show  
  end
  
  def remove
    player = @current_user.players.find_by :id => params[:player_id]
    @current_user.players.delete(player)
    redirect_to(team_path)
  end
  
end
