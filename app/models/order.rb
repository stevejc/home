class Order < ActiveRecord::Base
  attr_accessible :name, :address
  has_many :line_items, dependent: :destroy
  has_one :user
  
  validates :name, :address, presence: true
  
  def add_line_items_from_cart(cart)
    cart.line_items.each do |item|
      item.cart_id = nil
      line_items << item
    end
  end
end