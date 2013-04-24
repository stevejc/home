class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.string :title
      t.text :description
      t.decimal :price
      t.integer :quantity
      t.integer :shop_id

      t.timestamps
    end
  end
end
