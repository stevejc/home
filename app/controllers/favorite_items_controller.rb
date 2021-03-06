class FavoriteItemsController < ApplicationController
  

  def create
    @favorite = FavoriteItem.new
    @favorite.item_id = params[:id]
    @favorite.user_id = current_user.id
    if @favorite.save
      redirect_to :back, notice: 'Your favorite was added.'
    else
      redirect_to :back, alert: 'You were unable to favorite that item again.'
    end
  end
  
  def yourfavorites
    @favorites = current_user.favorite_items
  end
  
  def destroy
    @favorite = current_user.favorite_items.find(params[:id])
    @favorite.destroy
    redirect_to :back, notice: 'Your favorite was removed.'
  end
end