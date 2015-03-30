module Railsblocks
  module Auth
    class EmberController < ApplicationController
      respond_to :json

      def current_user_json
        if current_user
          Railsblocks::Auth::UserSerializer.new(current_user, :scope => current_user, :root => false).to_json
        else
          {}.to_json
        end
      end 

      private

      def authenticate_user_from_token!
        user_token = request.headers["X-CSRF-Token"].presence
        user       = user_token && Railsblocks::Auth::User.find_by_authentication_token(user_token.to_s)

        if user && Devise.secure_compare(user.authentication_token, token)
          sign_in user, store: false
        end
    
      end
    end
  end
end