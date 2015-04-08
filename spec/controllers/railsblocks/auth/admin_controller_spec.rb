require 'rails_helper'

module Railsblocks::Auth
  RSpec.describe AdminController, type: :controller do
    routes { Railsblocks::Auth::Engine.routes }

    controller do
      include Railsblocks::Auth::AdminController
      def index
        render text: "Authorized!"
      end
      
      # rescue_from Railsblocks::Auth::AdminController::NotAuthorized do |exception|
      #   render text: "Not Authorized!", :status => :forbidden
      # end
    end
    
    context "admin logged" do
      login_admin
    
      it "should have a current_user" do
        expect(subject.current_user).not_to be_nil
      end

      it "should get index" do
        get :index
        expect(response).to have_http_status(:ok)
      end
    end
    
    context "guest" do
      it "should not have a current_user" do
        expect(subject.current_user).to be_nil
      end

      it "should get index" do
        get :index
        expect(response).to redirect_to(railsblocks_auth.new_user_session_path)
        expect(response).to have_http_status(:found)
      end
    end
    
    context "user logged" do
      login_user

      it "should have a current_user" do
        expect(subject.current_user).not_to be_nil
      end

      it "should get index" do
        get :index
        expect(response).to redirect_to(railsblocks_auth.new_user_session_path)
        expect(response).to have_http_status(:found)
      end
    end
  end
end
