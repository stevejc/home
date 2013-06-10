# == Schema Information
#
# Table name: itemimages
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
  
  validates :item_id,  presence: true
  validates :image, presence: true
  validate :limit_number_of_images
  
  mount_uploader :image, PikUploader
    
  def limit_number_of_images
    if self.item.itemimages.size > 4
      errors.add(:base, "Exceeded limit of 5 images per item")
    end
  end
  
end
