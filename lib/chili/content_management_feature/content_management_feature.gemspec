$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "content_management_feature/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "content_management_feature"
  s.version     = ContentManagementFeature::VERSION
  s.authors     = ["mitaku"]
  s.email       = ["mitaku1104@gmail.com"]
  s.homepage    = ""
  s.summary     = "Summary of ContentManagementFeature."
  s.description = "Description of ContentManagementFeature."

  s.files = Dir["{app,config,db,lib}/**/*"] + ["MIT-LICENSE", "Rakefile", "README.rdoc"]

  s.add_dependency "rails", "~> 3.2.9"
  s.add_dependency 'chili', '~> 3.0'
  s.add_dependency 'carrierwave'
  s.add_dependency 'fog'

  s.add_development_dependency "sqlite3"
end
