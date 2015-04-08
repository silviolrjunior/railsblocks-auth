class CreateRailsblocksAuthProfiles < ActiveRecord::Migration
  def change
    create_table :railsblocks_auth_profiles do |t|
      t.string :name
      t.string :username
      t.string :company
      t.string :job_title
      t.references :user 

      t.timestamps null: false
    end
  end
end
