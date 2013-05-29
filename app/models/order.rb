# == Schema Information
#
# Table name: orders
#
#  id                  :integer          not null, primary key
#  name                :string(255)
#  address             :text
#  user_id             :integer
#  shop_id             :integer
#  shipping_address_id :integer
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#  carrier             :string(255)
#  tracking_number     :text
#  ship_date           :date
#  status              :string(255)
#

class Order < ActiveRecord::Base
  attr_accessible :name, :address, :carrier, :tracking_number, :ship_date, :shipping_address_id
  has_many :line_items, dependent: :destroy
  has_one :user
  has_one :shop
  has_one :shipping_address
  
  validates :name, :address, presence: true
  
  def add_line_items_from_cart(cart)
    cart.line_items.each do |item|
      item.cart_id = nil
      line_items << item
    end
  end
  
end
