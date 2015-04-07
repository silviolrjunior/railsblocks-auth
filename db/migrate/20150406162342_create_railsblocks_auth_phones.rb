class CreateRailsblocksAuthPhones < ActiveRecord::Migration
  def change
    create_table :railsblocks_auth_phones do |t|
      t.string :klass
      t.string :number
      t.references :user

      t.timestamps null: false
    end
  end
end
