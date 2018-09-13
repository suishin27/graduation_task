class CreateStocks < ActiveRecord::Migration[5.1]
  def change
    create_table :stocks do |t|
      t.string "product_type"
      t.string "manufacturer"
      t.string "serial_number", unique: true
      t.string "asset_management_number", unique: true
      t.string "situation", default: '在庫'
      t.string "lending_date"
      t.string "return_date"
      t.string "staff_id"
      t.string "remarks"
      t.string "last_lent_person"
      
      t.timestamps
    end
  end
end
