$:.push File.expand_path("lib", __dir__)

# Maintain your gem's version:
require "devise_jwt_test_helpers/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "devise_jwt_test_helpers"
  s.version     = DeviseJwtTestHelpers::VERSION
  s.authors     = ["Christoph Weegen"]
  s.email       = ["christophweegen@googlemail.com"]
  s.homepage    = "TODO"
  s.summary     = "TODO: Summary of DeviseJwtTestHelpers."
  s.description = "TODO: Description of DeviseJwtTestHelpers."
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.md"]

  s.add_dependency "rails", "~> 5.2.1"

  s.add_development_dependency "sqlite3"
end
