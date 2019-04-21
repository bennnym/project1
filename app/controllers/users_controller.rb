class UsersController < ApplicationController
  
  def new
    @user = User.new
  end
  
  def create
    @user = User.new user_params
    if @user.save 
      session[:user_id] = @user.id
      session[:team] = @user.team
      #this returns a boolean so we can pose it as a question
      redirect_to root_path
    else
      render :new #using render allows error messages to show
    end
    
  end
  
  private
  def user_params
    params.require(:user).permit(:email,:password,:password_confirmation, :team_id)
  end
end
