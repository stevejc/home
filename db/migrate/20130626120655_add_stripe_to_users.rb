class AddStripeToUsers < ActiveRecord::Migration
  def change
    add_column :users, :last4, :integer
    add_column :users, :card_type, :string
    add_column :users, :stripe_customer_token, :string
  end
end
