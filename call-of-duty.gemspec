# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'call_of_duty/version'

Gem::Specification.new do |spec|
  spec.name          = "call-of-duty"
  spec.version       = CallOfDuty::VERSION
  spec.authors       = ["hpoydar"]
  spec.email         = ["hpoydar@gmail.com"]
  spec.summary       = %q{Simple gem for querying a Call of Duty 4 server for information}
  spec.description   = spec.summary
  spec.homepage      = "http://github.com/hpoydar/call-of-duty"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec", "~> 2.14.1"

end
