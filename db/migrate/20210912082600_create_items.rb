class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.integer :genre_id, null: false
      t.string :item_name, null: false
      t.text :explanation, null: false
      t.float :price, null: false
      t.string :sale_status, null: false
      t.string :item_image_id, null: false

      t.timestamps
    end
  end
end
