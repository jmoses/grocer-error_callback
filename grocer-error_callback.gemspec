# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'grocer/error_callback/version'

Gem::Specification.new do |spec|
  spec.name          = "grocer-error_callback"
  spec.version       = Grocer::ErrorCallback::VERSION
  spec.authors       = ["Jon Moses"]
  spec.email         = ["jon@burningbush.us"]
  spec.description   = %q{Provide error callbacks to Grocer pushes}
  spec.summary       = %q{Provides error callbacks to Grocer pushes}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency 'grocer', '~> 0.3.4'

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
  spec.add_development_dependency 'mocha'
  spec.add_development_dependency 'rspec'
end
