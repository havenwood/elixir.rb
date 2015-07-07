# coding: utf-8
lib = File.expand_path '../lib', __FILE__
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

require 'elixir/version'

Gem::Specification.new do |gem|
  gem.name          = 'elixir.rb'
  gem.version       = Elixir::VERSION
  gem.author        = 'Shannon Skipper'
  gem.email         = ['shannonskipper@gmail.com']
  gem.license       = 'MIT'

  gem.summary       = 'The Elixir standard library in Ruby.'
  gem.description   = 'An implementation of parts of the Elixir standard library in Ruby.'
  gem.homepage      = 'https://github.com/havenwood/elixir.rb'

  gem.files         = `git ls-files -z`.split("\x0").reject { |path| path.start_with? 'test' }
  gem.require_paths = ['lib']

  gem.add_dependency 'base32', '~> 0.3', '>= 0.3.2'
  gem.add_dependency 'concurrent-ruby', '~> 0.8', '>= 0.8.0'

  gem.add_development_dependency 'rake', '~> 10.4', '>= 10.4.2'
  gem.add_development_dependency 'minitest', '~> 5.7', '>= 5.7.0'
end
