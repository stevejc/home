# == Schema Information
#
# Table name: reviews
#
#  id         :integer          not null, primary key
#  user_id    :string(255)
#  order_id   :integer
#  positive   :boolean
#  comment    :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Review < ActiveRecord::Base
  attr_accessible :comment, :order_id, :positive, :user_id
  
  belongs_to :user
  belongs_to :order
  has_many :shop, :through => :orders
  
end
