FactoryGirl.define do
  factory :railsblocks_auth_user, class: Railsblocks::Auth::User do
    sequence :email do |n|
      "person#{n}@example.com"
    end
    password               "password"
    password_confirmation  "password"
  end
end