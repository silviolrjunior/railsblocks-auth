class CreateRailsblocksAuthProfilePhones < ActiveRecord::Migration
  def change
    create_table :railsblocks_auth_profile_phones do |t|
      t.string :klass
      t.string :number
      t.references :profile

      t.timestamps null: false
    end
  end
end
