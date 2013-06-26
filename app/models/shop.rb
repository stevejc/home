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

class Shop < ActiveRecord::Base
  attr_accessible :about, :city, :name, :refund, :state, :zip, :image, :remove_image, :stripe_code
  attr_accessor :stripe_code
  belongs_to :user
  has_many :cart_orders, dependent: :destroy
  has_many :items
  has_many :line_items, :through => :items
  has_many :orders
  has_many :reviews, :through => :orders
  
  
  mount_uploader :image, PikUploader
  
  validates :user_id,  presence: true
  validates :name, presence: true, length: { maximum: 140 }
  validates :city, presence: true, length: { maximum: 60 }
  
  def save_with_stripe_account
    code_for_stripe = self.stripe_code
    #customer = `curl -X POST https://connect.stripe.com/oauth/token -d client_secret=#{ENV['STRIPE_SECRET_KEY']} -d code=#{code_for_stripe} -d grant_type=authorization_code`
    
    
    #customer = http.request_post('https://connect.stripe.com/oauth/token', 'client_secret=#{ENV['STRIPE_SECRET_KEY']}', 'code=#{code_for_stripe}', 'grant_type=authorization_code'  )
    raise customer.inspect 
      
  end
  
end
