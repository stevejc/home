class OrdersController < ApplicationController
  
  def new
    @cart = current_cart
    if @cart.line_items.empty?
      redirect_to root_url, notice: "Your cart is empty"
      return
    end
    @order = Order.new
  end
  
  def create
    @order = Order.new(params[:order])
    @order.add_line_items_from_cart(current_cart)
    @order.user_id = current_user.id
    
    if @order.save
      Cart.destroy(session[:cart_id])
      session[:cart_id]= nil
      redirect_to root_url, notice: 'Thank you for your order.'
    else
      @cart = current_cart
      render action: "new"
    end
  end
  
end