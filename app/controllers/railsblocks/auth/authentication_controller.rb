module Railsblocks
  module Auth
    module AuthenticationController
      def self.included m
        return unless m < ActionController::Base
        m.before_action :authenticate_user!
      end
    end
  end
end
