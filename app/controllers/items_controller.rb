class ItemsController < ApplicationController
  
  def new
    @item = Item.new
    @item.itemimage.build
  end
  
  def create
    @item = Item.new(params[:item])
    @item.shop_id = current_user.shop.id
    if @item.save
      redirect_to youritems_path, notice: "You have successfully added you item!"
    else
      render :new
    end
  end
  
  def index
    @items = Item.all
  end
  
  def youritems
    @items = current_user.shop.items
  end
  
  def show
    @item = Item.find(params[:id])
  end
  
  def youritem
    @item = Item.find(params[:id])
    redirect_to items_path if @item.shop.user_id != current_user.id
  end
  
  def edit
    @item = Item.find(params[:id])
  end
  
  def update
    @item = Item.find(params[:id])
    @image = @item.itemimage
    if @item.update_attributes(params[:item]) 
      redirect_to youritem_path(@item), notice: 'Your item was successfully updated.'
    else
      render :edit 
    end
  end
  
end