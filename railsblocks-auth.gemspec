$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "railsblocks/auth/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "railsblocks-auth"
  s.version     = Railsblocks::Auth::VERSION
  s.authors     = ["Celso Fernandes"]
  s.email       = ["fernandes@zertico.com"]
  s.homepage    = "https://github.com/railsblocks/railsblocks-auth"
  s.summary     = "Authentication System For Rails Blocks"
  s.description = "Authentication system based on devise, so everyblock knows how to handle user authorization"
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "LICENSE", "Rakefile", "README.md", "spec/factories/**/*.rb"]

  s.add_dependency "rails", "~> 4.2.0"
  s.add_dependency "devise", "~> 3.4"
  s.add_dependency "rolify", "~> 4.0.0"

  s.add_development_dependency "sqlite3", '~> 1.3'
  s.add_development_dependency "codeclimate-test-reporter", '~> 0.4'
  s.add_development_dependency 'combustion', '~> 0.5.2'
  s.add_development_dependency "database_cleaner", '~> 1.4'
  s.add_development_dependency "factory_girl_rails", '~> 4.5'
  s.add_development_dependency "rspec-rails", '~> 3.2'
  s.add_development_dependency "shoulda-matchers", '~> 2.8'
  s.add_development_dependency "thor", '~> 0.19'

end
