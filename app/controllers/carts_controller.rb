class CartsController < ApplicationController
  
  def show
    begin
      @cart = Cart.find(params[:id])
    rescue ActiveRecord::RecordNotFound
      logger.error "Attempt to access invalid cart #{params[:id]}"
      redirect_to root_url, notice: 'Invalid cart'
    else
      respond_to do |format|
        format.html #show.html.erb
        format.json { render json: @cart}
      end
    end
  end
  
end