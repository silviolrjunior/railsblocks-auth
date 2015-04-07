FactoryGirl.define do
  factory :railsblocks_auth_user, class: Railsblocks::Auth::User do
    sequence :email do |n|
      "person#{n}@example.com"
    end
    password               "password"
    password_confirmation  "password"
    
    factory :railsblocks_auth_user_with_profile do
      transient do
        phones_count 2
      end

      after(:create) do |user, evaluator|
        user.profile = FactoryGirl.create(:railsblocks_auth_profile, phones_count: evaluator.phones_count, user: user)
      end
      
      factory :railsblocks_auth_admin_with_profile do
        admin true
      end
    end
    
    factory :railsblocks_auth_admin do
      admin true
    end
  end
end