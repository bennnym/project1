class TeamController < ApplicationController
  before_action :check_for_login
  
  def show
    @team = Team.find_by :id => session[:team_id]
    
    
  end
  
end
