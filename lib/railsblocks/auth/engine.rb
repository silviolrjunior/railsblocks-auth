# Load engines view (not devise one) on wrapper app
require 'devise'

module Railsblocks
  module Auth
    class Engine < ::Rails::Engine
      isolate_namespace Railsblocks::Auth

      # Configure generators for this component
      config.generators do |g|
        g.orm             :active_record
        g.template_engine :haml
        g.stylesheets     false
        g.javascripts     false
        g.helper          false
        g.test_framework  :rspec, view_specs: false, request_specs: false, routing_specs: false, controller_specs: false
        g.fixture_replacement :factory_girl
        g.templates.unshift File::expand_path('../templates', __FILE__)
      end


      initializer "railsblocks-auth.factories", :after => "factory_girl.set_factory_paths" do
        FactoryGirl.definition_file_paths << File.expand_path('../../../../spec/factories', __FILE__) if defined?(FactoryGirl)
      end
      
      initializer 'railsblocks-auth' do |app|
        Railsblocks::Auth.instance_eval do
          array = Array(app.config.i18n.available_locales || [])
          pattern = array.blank? ? '*' : "{#{array.join ','}}"

          files = Dir[File.join(File.dirname(__FILE__), '../locales', "#{pattern}.yml")]
          I18n.load_path.concat(files)

          ActionView::Base.send :include, Railsblocks::Auth::DeviseBootstrapViewsHelper
        end
      end


      # Initialize engine dependencies on wrapper application
      Gem.loaded_specs["railsblocks-auth"].dependencies.each do |d|
        begin
          require d.name
        rescue LoadError => le
          # Put exceptions here.
          # raise le if d.name !~ /factory_girl_rails/
        end
      end


      # Load db migrations on rails app
      initializer :append_migrations do |app|
        unless app.root.to_s.match root.to_s
          config.paths["db/migrate"].expanded.each do |expanded_path|
            app.config.paths["db/migrate"] << expanded_path
          end
        end
      end
    end
  end
end