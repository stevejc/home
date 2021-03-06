class ItemimagesController < ApplicationController
  
  def new
    @itemimage = Itemimage.new(:item_id => params[:item_id])
  end
  
  def create
    @itemimage = Itemimage.new(params[:itemimage])
    if @itemimage.save
      respond_to do |format|
        if remotipart_submitted?
          format.js
        else
          format.html {redirect_to youritem_path(@itemimage.item), notice: "Successfully loaded your image."}
        end
      end
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
    @item = @itemimage.item
    @itemimage.destroy
    respond_to do |format|
      format.js
      format.html {redirect_to youritem_path(@itemimage.item), notice: "Successfully removed the image."}
    end
  end
  
end