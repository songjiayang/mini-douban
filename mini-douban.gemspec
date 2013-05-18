# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'mini/douban/version'

Gem::Specification.new do |spec|
  spec.name          = "mini-douban"
  spec.version       = Mini::Douban::VERSION
  spec.authors       = ["songjiayang"]
  spec.email         = ["songjiayang1@gmail.com"]
  spec.description   = %q{A mini gem for douban api}
  spec.summary       = %q{a mini gem for douban api}
  spec.homepage      = "https://github.com/songjiayang/mini-douban"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
end
