$:.push File.expand_path('lib', __dir__)

# Maintain your gem's version:
require 'devise_jwt_test_helpers/version'

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = 'devise_jwt_test_helpers'
  s.version     = DeviseJwtTestHelpers::VERSION
  s.authors     = ['Christoph Weegen']
  s.email       = ['christophweegen@googlemail.com']
  s.homepage    = 'https://github.com/christophweegen/devise_jwt_test_helpers'
  s.summary     = 'Test helpers for devise-jwt gem.'
  s.description = 'Useful helpers for easy testing of APIs using devise-jwt.'
  s.license     = 'MIT'

  s.files = Dir['{app,config,db,lib}/**/*', 'MIT-LICENSE', 'Rakefile', 'README.md']

  s.add_dependency "rails", '~> 5.2.3'

  s.add_development_dependency 'devise-jwt', '~> 0.5.9'
  s.add_development_dependency 'pry'
  s.add_development_dependency 'sqlite3'
end
