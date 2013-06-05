# == Schema Information
#
# Table name: cart_orders
#
#  id         :integer          not null, primary key
#  cart_id    :integer
#  shop_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class CartOrder < ActiveRecord::Base
  attr_accessible :cart_id, :shop_id
  
  has_many :line_items
  belongs_to :shop
  belongs_to :cart
  
end
