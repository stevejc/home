class ShippingAddress < ActiveRecord::Base
  attr_accessible :address1, :address2, :city, :name, :state, :zip
end
