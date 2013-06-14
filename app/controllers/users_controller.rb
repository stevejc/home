class UsersController < ApplicationController
  before_filter :signed_in_user, only: [:edit, :update, :show]
  before_filter :correct_user, only: [:edit, :update, :show]
  def new
    @user = User.new
  end
  
  def show
    @user = User.find(params[:id])
  end
  
  def create
    @user = User.new(params[:user])
    if @user.save
      cookies[:remember_token] = @user.remember_token
      sign_in @user
      redirect_to root_url, success: "Welcome to Home"
    else
      render 'new'
    end
  end
  
  def edit
  end
  
  def update
    if @user.update_attributes(params[:user])
      sign_in @user
      redirect_to user_path(@user), success: "You have successfully updated your profile"
    else
      render :edit
    end
  end
  
  private
     
     def correct_user
       @user = User.find(params[:id])
       redirect_to(root_path) unless current_user?(@user)
     end
  
  
end