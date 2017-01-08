# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'scrollmagicjs/rails/version'

Gem::Specification.new do |spec|
  spec.name          = "scrollmagicjs-rails"
  spec.version       = Scrollmagicjs::Rails::VERSION
  spec.authors       = ["Prabode Weebadde"]
  spec.email         = ["prabode@venturit.com"]
  spec.homepage    = "https://github.com/venturit/scrollmagicjs-rails"
  spec.summary     = "Use ScrollMagic with Rails 4+"
  spec.description = "This gem provides ScrollMagic for your Rails 4+ application."
  spec.license     = "MIT"

  spec.files = Dir["{lib,vendor}/**/*"] + ["MIT-LICENSE", "README.md"]
  
  spec.require_paths = ["lib"]
  
  spec.add_dependency "railties", ">= 4", "< 5.0"

end
