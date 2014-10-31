# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'cloudrider/version'

Gem::Specification.new do |spec|
  spec.name          = "cloudrider"
  spec.version       = Cloudrider::VERSION
  spec.authors       = ["Thomas Chen"]
  spec.email         = ["foxnewsnetwork@gmail.com"]
  spec.summary       = %q{Private gem for scaffolding one-page rails emberjs portfolio sites.}
  spec.description   = %q{Private gem for scaffolding one-page rails emberjs portfolio sites.}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.7"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~>3.1.0"
  spec.add_dependency "functional_support", '>=0.0.12'
  spec.add_dependency "tilt", ">=1.4"
  spec.add_dependency "activesupport", '>=3'
  # spec.add_dependency "actionpack", '>=3'
  # spec.add_dependency "actionview", '>=3'
  # spec.add_dependency "mime-types", ">=1.25.1"
end
