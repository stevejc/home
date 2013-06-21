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
#  status      :string(255)
#

class Item < ActiveRecord::Base
  attr_accessible :description, :price, :quantity, :title
  belongs_to :shop
  has_many :itemimages
  has_many :line_items
  has_many :favorite_items
  
  before_destroy :ensure_not_referenced_by_any_line_item
  before_create :update_item_status_to_pending
  
  validates :shop_id,  presence: true
  validates :quantity, :title, :description, :price, presence: true
  
  
  def self.text_search(query)
    if query.present?
      where("title @@ :q or description @@ :q", q: query)
    else
      scoped
    end
  end
  
  def my_favorite?(user)
    FavoriteItem.where('item_id = ? AND user_id = ?', self.id, user).exists?  
  end
  
  def update_status_to_available
    if quantity >= 1 && itemimages.exists?
      self.status = "Available"
      self.save
    end
  end
  
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
    
    def update_item_status_to_pending
      self.status = "Pending"
    end

end
