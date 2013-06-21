class CartOrdersController < ApplicationController
  
  def destroy
    @cart_order = CartOrder.find(params[:id])
    @cart_order.destroy

    respond_to do |format|
      format.html { redirect_to root_url,
        success: 'Your order has been deleted' }
      format.json { head :no_content }
    end
  end
  
end