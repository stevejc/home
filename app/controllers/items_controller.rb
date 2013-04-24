class ItemsController < ApplicationController
  
  def new
    @item = Item.new
  end
  
  def create
    @item = Item.new(params[:item])
    @item.shop_id = current_user.shop.id
    if @item.save
      redirect_to items_path, notice: "You have successfully added you shop!"
    else
      render :new
    end
  end
  
  def index
    @items = Item.all
  end
  
end