class OrdersController < ApplicationController
  before_filter :signed_in_user
  
  def new
    @cart_order = CartOrder.find(params[:cart_order_id])
    if @cart_order.line_items.empty?
      redirect_to root_url, notice: "Your order is empty"
      return
    end
    @order = Order.new
    @shippingaddresses = current_user.shipping_addresses
    @shippingaddress = ShippingAddress.new
  end
  
  def pay
    @cart_order = CartOrder.find(params[:cart_order_id])
    if @cart_order.line_items.empty?
      redirect_to root_url, notice: "Your order is empty"
      return
    end
    @order = Order.new
    @shippingaddress = ShippingAddress.find(params[:address_id])
    @order.shipping_address_id = @shippingaddress.id
  end
  
  def create
    @cart_order = CartOrder.find(params[:cart_order_id])
    @order = Order.new(params[:order])
    @order.add_line_items_from_cart(@cart_order)
    @order.user_id = current_user.id
    @order.shop_id = @cart_order.shop_id
    @shippingaddress = ShippingAddress.find(@order.shipping_address_id)
    
    if @order.save
      @cart_order.destroy
      redirect_to root_url, notice: 'Thank you for your order.'
    else
      @cart = current_cart
      render action: "pay"
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
    @shippingaddress = ShippingAddress.find(@order.shipping_address_id)
  end
  
  def yourorder
    @order = Order.find(params[:id])
    @shippingaddress = ShippingAddress.find(@order.shipping_address_id)
    redirect_to orders_path if @order.shop_id != current_user.shop.id
  end
  
  def edit
    @order = Order.find(params[:id])
  end
  
  def update
    @order = Order.find(params[:id])
    if @order.update_attributes(params[:order])
      redirect_to order_path(@order), notice: 'Your order was successfully updated.'
    else
      render :edit
    end
    
  end
  
  def shipment_details
    @order = Order.find(params[:id])
  end
  
  def updateshipping
    @order = Order.find(params[:id])
    if @order.update_attributes(params[:order])
      redirect_to yourorder_path(@order), notice: 'Your shipping information was successfully updated.'
    else
      render :shipment_details
    end
  end
  

  
end