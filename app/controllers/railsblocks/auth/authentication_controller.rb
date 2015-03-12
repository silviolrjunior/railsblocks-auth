module Railsblocks
  module Auth
    class AuthenticationController < ActionController::Base
      def self.included m
        return unless m < ActionController::Base
        m.before_action :authenticate_user!
      end
    end
  end
end
