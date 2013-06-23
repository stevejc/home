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
  belongs_to :shop
  has_one :shipping_address
  has_one :review
  
  validates :name, :address, presence: true
  
  after_create :update_prices, :update_available_quantities, :update_status
  
  def add_line_items_from_cart(cart_order)
    cart_order.line_items.each do |item|
      item.cart_id = nil
      line_items << item
    end
  end
  
  def update_prices
    line_items.each do |line_item|
      line_item.price = line_item.item.price
      line_item.save
    end
  end
  
  def update_available_quantities
    line_items.each do |line_item|
      line_item.item.quantity -= line_item.quantity
      line_item.item.save
    end
  end
  
  def total_price
    line_items.to_a.sum { |item| item.total_price }
  end
  
  def update_status
    self.status = "Order Submitted"
    self.save
  end
  
end
