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
  attr_accessible :description, :price, :quantity, :title
  belongs_to :shop
  has_many :itemimages
  has_many :line_items
  
  before_destroy :ensure_not_referenced_by_any_line_item
  
  validates :shop_id,  presence: true
  validates :title, :description, :price, presence: true
  
  private
  
    # ensure that there are no line items referencing this product
    def ensure_not_referenced_by_any_line_item 
      if line_items.empty?
        return true 
      else
        errors.add(:base, 'Line Items present')
        return false 
      end
    end

end
