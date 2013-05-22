class ShippingAddress < ActiveRecord::Base
  attr_accessible :address1, :address2, :city, :name, :state, :zip
  
  has_one :user
  
  #validates :address1, :city, :name, :state, :zip,  presence: true
end
