class ShippingAddressesController < ApplicationController
  
  def create
    @shippingaddress = ShippingAddress.new(params[:shipping_address])
    @shippingaddress.user_id = current_user.id
    if @shippingaddress.save
      redirect_to pay_path, notice: "You have successfully added your shipping address!"
    else
      render 'orders/new'
    end
  end
end