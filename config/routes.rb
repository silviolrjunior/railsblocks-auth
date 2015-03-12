Railsblocks::Auth::Engine.routes.draw do
  # devise_for :users, class_name: "Railsblocks::Auth::User"
  devise_for :users, class_name: "Railsblocks::Auth::User", path: "auth", module: :devise, path_names: 
    {
      sign_in: 'login',
      sign_out: 'logout',
      password: 'password',
      confirmation: 'verification',
      unlock: 'unblock',
      registration: 'register',
      sign_up: 'signup'
    }
end
