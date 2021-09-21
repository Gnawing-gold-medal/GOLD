class CreateInfomations < ActiveRecord::Migration[5.2]
  def change
    create_table :infomations do |t|
      t.integer :status, default: 0, null: false
      t.string :name, null: false
      t.string :telephone_number, null: false
      t.string :email,null: false
      t.integer :genre, default: 0, null: false
      t.text :content,null: false
      t.timestamps
    end
  end
end
