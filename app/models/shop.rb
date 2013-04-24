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
#

class Shop < ActiveRecord::Base
  attr_accessible :about, :city, :name, :refund, :state, :zip
  belongs_to :user
  has_many :items
  
  validates :user_id,  presence: true
  validates :name, presence: true, length: { maximum: 140 }
  validates :city, presence: true, length: { maximum: 60 }
  
end
