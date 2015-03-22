module Railsblocks
  module Auth
    class User < ActiveRecord::Base
      
      rolify role_cname: "Railsblocks::Auth::Role"

      # Include default devise modules. Others available are:
      # :confirmable, :lockable, :timeoutable and :omniauthable
      devise :database_authenticatable, :registerable,
             :recoverable, :rememberable, :trackable, :validatable
    end
  end
end
