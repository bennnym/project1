class UsersController < ApplicationController
  
  def new
    @user = User.new
  end
  
  def create
    @user = User.new user_params
    if @user.save 
      session[:user_id] = @user.id
      session[:team_id] = @user.team_id
      #this returns a boolean so we can pose it as a question
      redirect_to root_path
    else
      render :new #using render allows error messages to show
    end
  end
  
  def edit
    @user = User.find_by :id => @current_user.id
  end
  
  def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      @user.save
      return redirect_to team_path
    else
      render :edit
    end
    
  end
  
  private
  def user_params
    params.require(:user).permit(:email,:password,:password_confirmation, :team_id)
  end
end
