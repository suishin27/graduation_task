class ChangeStaffIdColumnToStock < ActiveRecord::Migration[5.1]
  def change
    change_column :stocks, :staff_id, :string, default: 0
  end
end
