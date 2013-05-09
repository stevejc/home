class LineItemsController < ApplicationController
  
  def create
      @cart = current_cart
      item = Item.find(params[:item_id])
      @line_item = @cart.add_item(item.id)
      @line_item.item = item

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
end