# == Schema Information
#
# Table name: items
#
#  id          :integer          not null, primary key
#  title       :string(255)
#  description :text
#  price       :decimal(, )
#  quantity    :integer
#  shop_id     :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Item < ActiveRecord::Base
  attr_accessible :description, :price, :quantity, :title, :itemimages_attributes
  belongs_to :shop
  has_many :itemimages
  accepts_nested_attributes_for :itemimages
  
  validates :shop_id,  presence: true
  validates :title, :description, :price, presence: true

end
