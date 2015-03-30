class AddAuthenticationTokenInUser < ActiveRecord::Migration
  def change
    add_column :railsblocks_auth_users, :authentication_token, :string
    add_index :railsblocks_auth_users, :authentication_token, :unique => true
  end
end
