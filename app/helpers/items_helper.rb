module ItemsHelper
  def format_quantity(quantity)
    if quantity <= 0
      "So sorry, this item is currently sold out!"
    elsif quantity == 1
      "Only 1 available"
    else
      "#{quantity} available."
    end
  end
  
  def display_loves(count)
    if count == 0
      "Be the first to favorite this item!"
    elsif count == 1
      "1 Person loves this item"
    else
      "#{count} People love this item."
    end
  end
  
  def display_status_update(item)
    if item.status == "Available"
      "Your item is listed for sale on HomePlace. If your item is no longer for sale please update the status to pending or change the quantity available to zero."
    elsif item.status == "Pending"
      "Your item is not yet listed for sale on HomePlace. Every item listed for sales requires at least one image, if your item is ready to go update the status to Available."
    else
      "Your item is not available for sale because the quantity available is zero. If you still have items available please update the quantity and change the status to Available."
    end
  end
end