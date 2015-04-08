module Railsblocks
  module Auth
    class SessionsController < Devise::SessionsController
      def destroy
        respond_to do |format|
          format.html do
            super
          end
          format.json do
            user = current_user
            signed_out = (
              Devise.sign_out_all_scopes ? sign_out : sign_out(resource_name)
            )
            if user.use_token?
              render json: {
                "csrf-param" => request_forgery_protection_token,
                "csrf-token" => form_authenticity_token

              }
            else
              render json: {}
            end
          end
        end
      end
    end
  end
end
