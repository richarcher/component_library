$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "component_library/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "component_library"
  s.version     = ComponentLibrary::VERSION
  s.authors     = ["Rich Archer"]
  s.email       = ["rich.archer@unboxedconsulting.com"]
  s.homepage    = "https://github.com/richarcher/component_library"
  s.summary     = "Create .erb partials of HTML markup to document your reusable CSS and JS components for other developers; and create prototypes to see how they function and look within your existing ecosystem."
  s.description = "Easily create your own HTML/CSS/JS component library"
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.md"]
  s.test_files = Dir["test/**/*"]

  s.add_development_dependency "sqlite3"
  s.add_development_dependency "rspec-rails", "~>3.4"

  s.add_dependency "rails", ">= 4.0.0"
  s.add_dependency "sass", "~> 3.4", ">= 3.4.21"
end
