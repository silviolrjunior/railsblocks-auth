class AddAdminToRailsblocksAuthUser < ActiveRecord::Migration
  def change
    add_column :railsblocks_auth_users, :admin, :boolean, default: false
  end
end
