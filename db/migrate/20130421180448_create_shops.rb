class CreateShops < ActiveRecord::Migration
  def change
    create_table :shops do |t|
      t.integer :user_id
      t.string :name
      t.string :city
      t.string :state
      t.string :zip
      t.text :about
      t.text :refund

      t.timestamps
    end
  end
end
