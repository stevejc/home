# == Schema Information
#
# Table name: favorite_items
#
#  id         :integer          not null, primary key
#  item_id    :integer
#  user_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'test_helper'

class FavoriteItemTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
