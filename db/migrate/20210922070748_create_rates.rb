class CreateRates < ActiveRecord::Migration[5.2]
  def change
    create_table :rates do |t|
      t.float :star
      t.integer :customer_id
      t.integer :item_id

      t.timestamps
    end
  end
end
