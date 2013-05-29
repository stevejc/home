# == Schema Information
#
# Table name: line_items
#
#  id         :integer          not null, primary key
#  cart_id    :integer
#  item_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  quantity   :integer          default(1)
#  order_id   :integer
#  shop_id    :integer
#  price      :decimal(, )
#

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
