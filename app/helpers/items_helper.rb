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
end