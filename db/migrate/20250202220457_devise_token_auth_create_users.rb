class DeviseTokenAuthCreateUsers < ActiveRecord::Migration[7.1]
  def change
    # Add required fields for DeviseTokenAuth
    add_column :users, :provider, :string, default: "email", null: false
    add_column :users, :uid, :string, null: false, default: ""

    # Add unique index for authentication with DeviseTokenAuth
    add_index :users, [:uid, :provider], unique: true
  end
end
