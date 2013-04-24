class ShopsController < ApplicationController
  before_filter :signed_in_user
  
  def new
    @shop = Shop.new
  end
  
  def create
    @shop = Shop.new(params[:shop])
    @shop.user_id = current_user.id
    if @shop.save
      redirect_to shops_path, notice: "You have successfully added you shop!"
    else
      render :new
    end
  end
  
  def show
    @shop = Shop.find(params[:id])
  end
  
  def yourshop
    @shop = current_user.shop
  end
  
  def edit
    @shop = Shop.find(params[:id])
  end
  
  def update
    @shop = Shop.find(params[:id])
    if @shop.update_attributes(params[:shop])
      redirect_to @shop, notice: 'Your shop was successfully updated.'
    else
      render :edit 
    end
  end
  
  def index
    @shops = Shop.all
  end
  
  def destroy
  end
  
end