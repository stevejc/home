# == Schema Information
#
# Table name: item_images
#
#  id          :integer          not null, primary key
#  item_id     :integer
#  image       :string(255)
#  image_order :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Itemimage < ActiveRecord::Base
  attr_accessible :image, :image_order, :item_id, :remove_image
  belongs_to :item
  
  mount_uploader :image, PikUploader
  
  #validates :item_id,  presence: true
  #validates :image, presence: true
  
end
