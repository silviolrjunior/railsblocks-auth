require "rails_helper"

module Railsblocks::Auth
  RSpec.describe EmberController, type: :controller do
    
    describe "GET #current_user_json" do
      before :each do
        @user = Railsblocks::Auth::User.create(
          { email: "example@example.com", password: "12345678" }
        )
      end

      it "responds successfully with an HTTP 200 status code" do
        expect(response).to be_success
        expect(response).to have_http_status(200)
      end

      context "current_user is setted" do
        before :each do 
          allow(controller).to receive(:current_user) { @user }
          @user_json = Railsblocks::Auth::UserSerializer.new(
            @user, scope: @user, root: false
          ).to_json
        end
        it "loads a user serializer" do
          subject.current_user_json.should eq @user_json
        end
      end

      context "current_user is nil" do
        before :each do
          allow(controller).to receive(:current_user) {}
          @user_json = {}.to_json
        end
        it "loads a empty hash" do
          subject.current_user_json.should eq @user_json
        end
      end
    end
  end
end
