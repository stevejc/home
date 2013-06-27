class AddStripeToShops < ActiveRecord::Migration
  def change
    add_column :shops, :stripe_shop_token, :string
  end
end
