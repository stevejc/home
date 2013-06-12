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
end