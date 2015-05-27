# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'zadarest/version'

Gem::Specification.new do |spec|
  spec.name          = "zadarest"
  spec.version       = Zadarest::VERSION
  spec.authors       = ["Dan Collis-Puro"]
  spec.email         = ["dan_collis-puro@harvard.edu"]

  spec.summary       = %q{A REST client for zarada VPSAs}
  spec.homepage      = 'http://www.dce.harvard.edu/'
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.2.0"
  spec.add_development_dependency "pry-byebug", '~> 2.0'

  spec.add_dependency "faraday", "~> 0.9.1"
end
