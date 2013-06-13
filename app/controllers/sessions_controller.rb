class SessionsController < ApplicationController
  def new
  end
  
  def create
    user = User.find_by_email(params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      sign_in user
      flash[:notice] = "Welcome back to Home!"
      redirect_back_or root_url
    else
      flash.now.alert = "Email or password is invalid"
      render 'new'
    end
  end
  
  def destroy
    sign_out
    flash[:notice] = "You have successfully logged out"
    redirect_to root_url
  end
  
end