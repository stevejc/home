class ItemimagesController < ApplicationController
  
  def new
    @itemimage = Itemimage.new(:item_id => params[:item_id])
  end
  
  def create
    @itemimage = Itemimage.new(params[:itemimage])
    if @itemimage.save
      flash[:notice] = "Successfully created painting."
      redirect_to youritem_path(@itemimage.item)
    else
      render :action => 'new'
    end
  end
  
  def destroy
    @itemimage = Itemimage.find(params[:id])
    @itemimage.destroy
    flash[:notice] = "Successfully removed the picture."
    redirect_to youritem_path(@itemimage.item)
  end
  
end