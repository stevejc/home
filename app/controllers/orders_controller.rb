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
    @order.shop_id = current_cart.line_items.first.item.shop_id
    
    if @order.save
      Cart.destroy(session[:cart_id])
      session[:cart_id]= nil
      redirect_to root_url, notice: 'Thank you for your order.'
    else
      @cart = current_cart
      render action: "new"
    end
  end
  
  def yourshoporders
    @orders = current_user.shop.orders
  end
  
  def yourorders
    @orders = current_user.orders
  end
  
  def show
    @order = Order.find(params[:id])
  end
  
  def yourorder
    @order = Order.find(params[:id])
    redirect_to orders_path if @order.shop_id != current_user.shop.id
  end
  
end