module Railsblocks
  module Auth
    class Profile
      class Phone < ActiveRecord::Base
        belongs_to :profile, class_name: "Railsblocks::Auth::Profile"

        KLASS=["mobile", "work", "home"]
      end
    end
  end
end
