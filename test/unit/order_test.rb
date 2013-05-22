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

require 'test_helper'

class OrderTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
