module ControllerMacros
  def login_admin
    before(:each) do
      sign_in FactoryGirl.create(:railsblocks_auth_admin) # Using factory girl as an example
    end
  end

  def login_user
    before(:each) do
      user = FactoryGirl.create(:railsblocks_auth_user)
      sign_in user
    end
  end
end
