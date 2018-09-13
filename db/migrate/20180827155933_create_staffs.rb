class CreateStaffs < ActiveRecord::Migration[5.1]
  def change
    create_table :staffs do |t|
      t.string "staff_id", unique: true
      t.string "staff_name"
      t.string "postal_code"
      t.string "street_address_1"
      t.string "street_address_2"
      t.string "phone_number_1"
      t.string "phone_number_2"
      t.string "enrolled"
      t.date "scheduled_return_date"
      t.text "remarks"
      t.timestamps
    end
  end
end
