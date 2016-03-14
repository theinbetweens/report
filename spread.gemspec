$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "spread/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "spread"
  s.version     = Spread::VERSION
  s.authors     = ["Warren Sangster"]
  #s.homepage    = "TODO"
  s.summary     = "Generate a CSV version of a database table"
  s.description = "Generate a CSV version of a database table"

  s.files = Dir["{app,config,db,lib}/**/*"] + ["MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails", "~> 3.2.16"
  # s.add_dependency "jquery-rails"

  s.add_development_dependency "sqlite3", '~> 1.3.10'
  s.add_development_dependency 'rspec-rails', '~> 3.1.0'
  
end
