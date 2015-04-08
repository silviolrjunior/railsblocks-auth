module Railsblocks
  module Auth
    class UserSerializer < ActiveModel::Serializer
      attributes :id, :email
    end
  end
end
