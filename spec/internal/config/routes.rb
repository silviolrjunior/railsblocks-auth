Rails.application.routes.draw do
  mount Railsblocks::Auth::Engine, at: "/"
  #
end
