# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'aric/version'

Gem::Specification.new do |spec|
  spec.name          = 'aric'
  spec.version       = Aric::VERSION
  spec.authors       = ['ganmacs']
  spec.email         = ['ganmacs@gmail.com']

  spec.summary       = 'Awesome Ruby Ituens Client'
  spec.homepage      = 'https://github.com/ganmacs/aric'

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = 'bin'
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']
  spec.add_dependency 'hashie', '~> 3.4.0'

  spec.add_development_dependency 'bundler', '~> 1.9'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'rspec'
end
