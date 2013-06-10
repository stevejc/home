module OrdersHelper

    def display_items_in_order(order)
      items = ""
      order.line_items.each do |line_item|
      items += line_item.item.title + "<br/>"
      end
      return items
    end
end