module Railsblocks
  module Auth
    class User < ActiveRecord::Base
      before_save :verify_if_use_token  
      rolify role_cname: "Railsblocks::Auth::Role"

      # Include default devise modules. Others available are:
      # :confirmable, :lockable, :timeoutable and :omniauthable
      devise :database_authenticatable, :registerable,
             :recoverable, :rememberable, :trackable, :validatable

      def verify_if_use_token
        if self.class.use_token?
          if authentication_token.blank?
            self.authentication_token = generate_authentication_token
          end
        end
      end

      private
      
      def generate_authentication_token
        loop do
          token = Devise.friendly_token
          break token unless Railsblocks::Auth::User.where(authentication_token: token).first
        end
      end

      def self.use_token?
        false
      end

    end
  end
end