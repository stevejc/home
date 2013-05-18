class LineItem < ActiveRecord::Base
  attr_accessible :cart_id, :item_id
  belongs_to :item
  belongs_to :cart
  belongs_to :order
  has_one :shop, :through => :item
  
  def total_price
    item.price * quantity
  end
  
end
