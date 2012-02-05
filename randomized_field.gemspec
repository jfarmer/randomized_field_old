$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "randomized_field/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "randomized_field"
  s.version     = RandomizedField::VERSION
  s.authors     = ["Jesse Farmer"]
  s.email       = ["jesse@20bits.com"]
  s.homepage    = "http://github.com/jfarmer/randomzied_field"
  s.summary     = "An ActiveRecord plugin to populate a database field with a unique, randomly-generated string"
  s.description = <<-EOM
RandomizedField is a simple plugin for ActiveRecord that populates a field with a unique,
randomly-generated string.  This is useful for generating one-off tokens or creating a
non-incrementing unique ID.  See the project page for example uses.
EOM

  s.files = Dir["{app,config,db,lib}/**/*"] + ["MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails", "~> 3.1"

  s.add_development_dependency "sqlite3"
end
