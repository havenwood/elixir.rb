# coding: utf-8
lib = File.expand_path '../lib', File.basename(__FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'elixir/version'

Gem::Specification.new do |gem|
  gem.name          = 'elixir.rb'
  gem.version       = Elixir::VERSION
  gem.author        = 'Shannon Skipper'
  gem.license       = 'MIT'
  gem.email         = ['shannonskipper@gmail.com']

  gem.summary       = 'The Elixir standard library implemented in Ruby. This is currently just a code spike with parts of Enum and Stream.'
  gem.description   = 'A Ruby implementation of part of the Elixir standard library.'
  gem.homepage      = 'https://github.com/havenwood/elixir.rb'

  gem.files         = `git ls-files -z`.split("\x0").reject { |path| path.start_with? 'test' }
  gem.require_paths = ['lib']

  gem.add_development_dependency 'rake', '~> 10.0'
  gem.add_development_dependency 'minitest', '~> 5.7'
end
