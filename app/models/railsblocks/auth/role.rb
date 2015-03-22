module Railsblocks
  module Auth
    class Role < ActiveRecord::Base
      has_and_belongs_to_many :users, :join_table => :auth_users_auth_roles
      belongs_to :resource, :polymorphic => true
  
      scopify
    end
  end
end
