FactoryGirl.define do
  factory :railsblocks_auth_profile, class: Railsblocks::Auth::Profile do
    name { Faker::Name.name }
    username { name.gsub(/\s/,'_').downcase.gsub(/[^a-z_]/,'') }
    company { "#{Faker::Company.suffix} #{Faker::Company.name}" }
    job_title "CEO"
    
    transient do
      phones_count 2
    end
    
    after(:create) do |profile, evaluator|
      create_list(:railsblocks_auth_profile_phone, evaluator.phones_count, profile: profile)
    end
  end
end
