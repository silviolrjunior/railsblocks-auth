module Railsblocks::Auth
  class Profile < ActiveRecord::Base
    belongs_to :user
    has_many :phones
    accepts_nested_attributes_for :phones, allow_destroy: true
  end
end
