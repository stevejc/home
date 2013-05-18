class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.string :name
      t.text :address
      t.integer :user_id
      t.integer :shop_id
      t.integer :shipping_address_id

      t.timestamps
    end
  end
end
