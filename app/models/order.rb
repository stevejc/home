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
  attr_accessible :name, :address, :carrier, :tracking_number, :ship_date, :shipping_address_id, :stripe_card_token
  attr_accessor :stripe_card_token
  
  has_many :line_items, dependent: :destroy
  belongs_to :user
  belongs_to :shop
  has_one :shipping_address
  has_one :review
  
  validates :name, :address, presence: true
  
  after_create :update_prices, :update_available_quantities, :update_status
  
  def add_line_items_from_cart(cart_order)
    cart_order.line_items.each do |item|
      item.cart_id = nil
      item.cart_order_id = nil
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
  
  def save_with_credit_card
    if valid?
      if !self.stripe_card_token.empty?
        email = User.find(self.user_id).email
        customer = Stripe::Customer.create(email: email, card: stripe_card_token)
        user = User.find(self.user_id)
        user.stripe_customer_token = customer.id
        user.last4 = customer.active_card.last4
        user.card_type = customer.active_card.type
        user.save
      end
      self.save!
    end
  rescue Stripe::InvalidRequestError => e
    logger.error "Stripe error while creating customer: #{e.message}"
    errors.add :base, "There was a problem with your credit card."
    false
  end
  
  def save_and_bill_customer
    
    customer_token = Stripe::Token.create(
      {:customer => self.user.stripe_customer_token},
      self.shop.stripe_shop_token # user's access token from the Stripe Connect flow
    )
    
    charge = Stripe::Charge.create({
      :amount => (self.total_price*100).to_i,
      :currency => "usd",
      :card => customer_token['id'], # obtained with Stripe.js
      :description => "Charge for test@example.com",
      :application_fee => (self.total_price * 0.035 * 100).to_i
    }, self.shop.stripe_shop_token)
    
    self.status = "Paid"
    self.save!
  end
  
end
