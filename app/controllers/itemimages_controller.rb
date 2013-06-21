class ItemimagesController < ApplicationController
  
  def new
    @itemimage = Itemimage.new(:item_id => params[:item_id])
  end
  
  def create
    @itemimage = Itemimage.new(params[:itemimage])
    if @itemimage.save
      flash[:success] = "Successfully created painting."
      redirect_to youritem_path(@itemimage.item)
    else
      render :action => 'new'
    end
  end
  
  def sort
    params[:picture].each_with_index do |id, index|
      Itemimage.update_all({image_order: index+1}, {id: id})
    end
    render nothing: true
  end
  
  def destroy
    @itemimage = Itemimage.find(params[:id])
    @itemimage.destroy
    flash[:success] = "Successfully removed the picture."
    redirect_to youritem_path(@itemimage.item)
  end
  
end