require 'rails_helper'

module Railsblocks::Auth
  RSpec.describe User, type: :model do
    before (:each) { @user = FactoryGirl.create(:railsblocks_auth_user) }
    context "has roles" do
      it { expect(@user.respond_to?(:has_role?)).to eq(true) }
    end
    
    context "add role" do
      it "has role" do
        @user.add_role :admin
        expect(@user.has_role?(:admin)).to eq(true)
      end
    end

    describe "#verify_if_use_token" do
      context "use token is true" do
        before :each do
          @user.should_receive(:use_token?) {true}
          @user.should_receive(:generate_authentication_token) {"923dqzzsWasAQFTGRadaasad2A"}
        end

        it "should generate token" do
          @user.send(:verify_if_use_token)
          @user.authentication_token.should eq "923dqzzsWasAQFTGRadaasad2A"
        end
      end

      context "use token is false" do

        it "should not generate token" do
          @user.send(:verify_if_use_token)
          @user.authentication_token.should be nil
        end
      end
    end

    describe "#generate_authentication_token" do
      before :each do
        Devise.should_receive(:friendly_token) { "923dqzzsWasAQFTGRadaasad2A"}
      end
      it "should generate authentication token" do
        @user.send(:generate_authentication_token).should eq "923dqzzsWasAQFTGRadaasad2A"
      end
    end
  end
end
