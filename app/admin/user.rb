ActiveAdmin.register Railsblocks::Auth::User, as: "User" do
  
  controller do
    include ActiveTrail::Controller
  end

  show do
    h3 user.email
    attributes_table do
      row :name
      row :username
      row :company
      row :job_title
    end
    active_admin_comments
  end

  index do
    id_column
    column :name
    column :company
    column :email
    column :admin
    actions
  end

  form do |f|
    f.semantic_errors
    f.inputs "Account" do
      f.input :email
      f.input :password
      f.input :password_confirmation
    end
    f.inputs "Profile", for: [:profile, object.profile || Railsblocks::Auth::Profile.new] do |p|
      p.input :name
      p.input :username
      p.input :company
      p.input :job_title

      p.has_many :phones, allow_destroy: true, heading: 'Phones' do |ph|
        ph.input :klass, label: "Phone Type", collection: Railsblocks::Auth::Profile::Phone::KLASS.map{ |k| [k.humanize, k] }
        ph.input :number
      end
    end
    f.actions
  end
end
