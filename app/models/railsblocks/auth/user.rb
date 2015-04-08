module Railsblocks
  module Auth
    class User < ActiveRecord::Base
      before_save :verify_if_use_token
      
      delegate :name, to: :profile
      delegate :company, to: :profile
      delegate :username, to: :profile
      delegate :job_title, to: :profile
      
      rolify role_cname: "Railsblocks::Auth::Role"
      # Include default devise modules. Others available are:
      # :confirmable, :lockable, :timeoutable and :omniauthable
      devise :database_authenticatable, :registerable,
             :recoverable, :rememberable, :trackable, :validatable

      has_one :profile
      has_many :phones, through: :profile, class_name: "Railsblocks::Auth::Profile::Phone"
      accepts_nested_attributes_for :profile, allow_destroy: true

      def verify_if_use_token
        if use_token?
          if authentication_token.blank?
            self.authentication_token = generate_authentication_token
          end
        end
      end

      def use_token?
        false
      end

      class Create < Trailblazer::Operation
        include CRUD

        model User, :create

        contract do
          
          property :email
          property :password

          property :profile, populate_if_empty: Profile do
            property :name
            property :username
            property :company
            property :job_title
            
            collection :phones, populate_if_empty: Profile::Phone do
              include ActiveTrail::Reform::NestedForm
              property :klass
              property :number
            end
          end
        end

        def process(params)
          self
        end
      end

      class Update < Create
        action :update
        
        def process(params)
          validate(params[:user]) do |f|
            f.save
          end
        end
        
        def setup_params!(params)
          params[:user].delete(:password) if params[:user][:password].empty?
        end
      end

      class Index < Trailblazer::Operation
        include CRUD, Scope, Pagination

        def fetch(params)
          User.all
        end
      end

      class Show < Trailblazer::Operation
        include CRUD

        model User

        contract do
          property :email
          property :password

          property :profile, populate_if_empty: Profile do
            property :name
            property :username
            property :company
            property :job_title
            
            collection :phones do
              property :klass
              property :number
            end
          end
        end

        def process(params)
          self
        end

        def setup_model!(params)
          @model = User.find(params[:id])
        end
      end

      private

      def generate_authentication_token
        loop do
          token = Devise.friendly_token
          break token unless Railsblocks::Auth::User.where(authentication_token: token).first
        end
      end
    end
  end
end
