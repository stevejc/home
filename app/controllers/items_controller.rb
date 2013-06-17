class ItemsController < ApplicationController
  
  def new
    @item = Item.new
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
    @items = Item .all
    @favorites = current_user.favorite_items
  end
  
  def youritems
    @items = current_user.shop.items
  end
  
  def show
    @item = Item.find(params[:id])
    @items = @item.shop.items.where('id != ?', @item.id).limit(3)
    @items_count = @item.shop.items.size
    @lineitem = LineItem.new
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