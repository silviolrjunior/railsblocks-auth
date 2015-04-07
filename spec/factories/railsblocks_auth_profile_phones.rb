FactoryGirl.define do
  factory :railsblocks_auth_profile_phone, class: Railsblocks::Auth::Profile::Phone do
    klass { Railsblocks::Auth::Profile::Phone::KLASS.sample }
    number { Faker::PhoneNumber.phone_number }
  end
end
