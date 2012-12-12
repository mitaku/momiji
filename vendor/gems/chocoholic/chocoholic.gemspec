$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "chocoholic/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "chocoholic"
  s.version     = Chocoholic::VERSION
  s.authors     = ["Takumi MIURA"]
  s.email       = ["mitaku1104@gmail.com"]
  s.homepage    = ""
  s.summary     = "Summary of Chocoholic."
  s.description = "Description of Chocoholic."

  s.files = Dir["{app,config,db,lib}/**/*"] + ["MIT-LICENSE", "Rakefile", "README.rdoc"]

  s.add_dependency "rails", "~> 3.2.9"
  # s.add_dependency "jquery-rails"
  s.add_dependency "jquery-rails"
  s.add_dependency "haml-rails"
  s.add_dependency "coffee-rails"

  s.add_development_dependency "sqlite3"
  s.add_development_dependency "tapp"
  s.add_development_dependency "awesome_print"
  s.add_development_dependency "pry-rails"
  s.add_development_dependency "factory_girl"
  s.add_development_dependency "rspec-rails"
  s.add_development_dependency 'shoulda-matchers'
  s.add_development_dependency 'database_cleaner'
  s.add_development_dependency 'spork'
  s.add_development_dependency 'rb-fsevent'
  s.add_development_dependency 'guard-rspec'
  s.add_development_dependency 'guard-spork'
  s.add_development_dependency 'growl'
  s.add_development_dependency 'capybara'
  s.add_development_dependency 'capybara-webkit'
  s.add_development_dependency 'timecop'
  s.add_development_dependency 'haml-rails'
end
