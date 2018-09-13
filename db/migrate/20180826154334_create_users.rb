class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :login_id
      t.string :password_digest
      t.text :user_name
      t.timestamps
    end
  end
end
