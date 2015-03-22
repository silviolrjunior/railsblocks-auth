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
  end
end
