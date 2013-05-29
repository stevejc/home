class LineItemsController < ApplicationController
  
  def create
    @cart = current_cart
    item = Item.find(params[:item_id])
    @line_item = @cart.add_item(item.id)
    @line_item.item = item
    @line_item.shop_id = @line_item.item.shop_id

    respond_to do |format|
      if @line_item.save
        format.html { redirect_to @line_item.cart,
          notice: 'Line item was successfully created.' }
        format.json { render json: @line_item,
          status: :created, location: @line_item }
      else
        format.html { render action: "new" }
        format.json { render json: @line_item.errors,
          status: :unprocessable_entity }
      end
    end
  end
  
  def destroy
    @line_item = LineItem.find(params[:id])
    @line_item.destroy

    respond_to do |format|
      format.html { redirect_to root_url, notice: "The #{@line_item.item.title} has been removed from your cart" }
      format.json { head :no_content }
    end
  end
    
    
end