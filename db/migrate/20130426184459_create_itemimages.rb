class CreateItemimages < ActiveRecord::Migration
  def change
    create_table :itemimages do |t|
      t.integer :item_id
      t.string :image
      t.integer :image_order

      t.timestamps
    end
  end
end
