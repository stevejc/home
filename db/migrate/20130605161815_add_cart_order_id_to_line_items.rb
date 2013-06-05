class AddCartOrderIdToLineItems < ActiveRecord::Migration
  def change
    add_column :line_items, :cart_order_id, :integer
  end
end
