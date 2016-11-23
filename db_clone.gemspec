# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'db_clone/version'

Gem::Specification.new do |spec|
  spec.name = "db_clone"
  spec.version = DbClone::VERSION.dup
  spec.authors = ["Igor Gonchar"]
  spec.email = ["igor.gonchar@gmail.com"]

  spec.summary = %q{Clone your development database}
  spec.homepage = "https://github.com/gigorok/db_clone"
  spec.license = "MIT"

  spec.files = `git ls-files -z`.split("\x0")
  spec.executables = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec"

  spec.add_dependency 'railties', '>= 3.2'
end
