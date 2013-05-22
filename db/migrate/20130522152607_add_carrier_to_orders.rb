class AddCarrierToOrders < ActiveRecord::Migration
  def change
    add_column :orders, :carrier, :string
    add_column :orders, :tracking_number, :text
    add_column :orders, :ship_date, :date
    add_column :orders, :status, :string
  end
end
