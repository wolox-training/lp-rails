class AddDeviseFieldsToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :sign_in_count, :integer
    add_column :users, :current_sign_in_at, :timestamp
    add_column :users, :last_sign_in_at, :timestamp
    add_column :users, :current_sign_in_ip, :string
    add_column :users, :last_sign_in_ip, :string
  end
end
