$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "spread/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "spread"
  s.version     = Spread::VERSION
  s.authors     = ["TODO: Your name"]
  s.email       = ["TODO: Your email"]
  s.homepage    = "TODO"
  s.summary     = "TODO: Summary of Spread."
  s.description = "TODO: Description of Spread."

  s.files = Dir["{app,config,db,lib}/**/*"] + ["MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails", "~> 3.2.22"
  # s.add_dependency "jquery-rails"

  s.add_development_dependency "sqlite3", '~> 1.3.10'
  
end
