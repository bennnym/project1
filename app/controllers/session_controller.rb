class SessionController < ApplicationController
  def new
  end
  
  def create
    # this locates the user in the system
    user = User.find_by :email => params[:email]
    
    # if the user returns something and the password is authenticated 
    if user.present? && user.authenticate(params[:password])
      # then we assisgn the session key of user id to the actual user.id
      session[:user_id] = user.id
      redirect_to root_path
      
      # either the user didnt enter a valid email, or the password didnt match the email entered
    else
      flash[:error] = 'Invalid Email or Password'
      redirect_to login_path
    end
  end
  
  def destroy
    session[:user_id] = nil
    redirect_to login_path
  end
      
end
