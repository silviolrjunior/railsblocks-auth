class RolifyCreateRailsblocksAuthRoles < ActiveRecord::Migration
  def change
    create_table(:railsblocks_auth_roles) do |t|
      t.string :name
      t.references :resource, :polymorphic => true

      t.timestamps null: false
    end

    create_table(:railsblocks_auth_users_railsblocks_auth_roles, :id => false) do |t|
      t.references :user
      t.references :role
    end

    add_index(:railsblocks_auth_roles, :name)
    add_index(:railsblocks_auth_roles, [ :name, :resource_type, :resource_id ], name: 'index_auth_roles_on_name_and_resource_type_and_resource_id')
    add_index(:railsblocks_auth_users_railsblocks_auth_roles, [ :user_id, :role_id ], name: 'index_auth_users_railsblocks_auth_roles_on_user_id_and_role_id')
  end
end
