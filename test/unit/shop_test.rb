# == Schema Information
#
# Table name: shops
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  name       :string(255)
#  city       :string(255)
#  state      :string(255)
#  zip        :string(255)
#  about      :text
#  refund     :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  image      :string(255)
#

require 'test_helper'

class ShopTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
