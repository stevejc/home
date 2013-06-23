class ShopsController < ApplicationController
  before_filter :signed_in_user, except: [:show]
  
  def new
    @shop = Shop.new
  end
  
  def create
    @shop = Shop.new(params[:shop])
    @shop.user_id = current_user.id
    if @shop.save
      redirect_to yourshop_path, success: "You have successfully added you shop!"
    else
      render :new
    end
  end
  
  def show
    @shop = Shop.find(params[:id])
    @reviews = @shop.reviews
  end
  
  def yourshop
    @shop = current_user.shop
  end
  
  def edit
    @shop = current_user.shop
  end
  
  def update
    @shop = current_user.shop
    if @shop.update_attributes(params[:shop])
      redirect_to yourshop_path, success: 'Your shop was successfully updated.'
    else
      render :edit 
    end
  end
  
  def index
    @shops = Shop.all
  end
  
end