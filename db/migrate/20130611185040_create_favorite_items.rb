class CreateFavoriteItems < ActiveRecord::Migration
  def change
    create_table :favorite_items do |t|
      t.integer :item_id
      t.integer :user_id

      t.timestamps
    end
    
    add_index :favorite_items, :user_id
    add_index :favorite_items, :item_id
  end
end
