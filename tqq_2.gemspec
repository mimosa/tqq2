# -*- encoding: utf-8 -*-
require File.expand_path('../lib/tqq_2/version', __FILE__)

# Describe your gem and declare its dependencies:
Gem::Specification.new do |gem|
  gem.authors       = ["Howl王"]
  gem.email         = ["howl.wong@gmail.com"]
  gem.description   = "A wrapper for 'open.t.qq.com' OAuth2 API"
  
  gem.summary       = "A wrapper for 'open.t.qq.com' OAuth2 API"
  gem.homepage      = "https://github.com/mimosa/tqq_2"

  gem.files         = `git ls-files`.split($\)
  gem.name          = "tqq_2"
  gem.require_paths = ["lib"]
  gem.version       = TqqOAuth2::VERSION

  gem.add_development_dependency "rspec", "~> 2.6"
  
  gem.add_runtime_dependency 'oauth2', "~> 0.9.1"
  gem.add_runtime_dependency 'hashie', "~> 2.0.4"
  gem.add_runtime_dependency 'multi_json'  , "~> 1.7.2"
  gem.add_runtime_dependency 'rest-client', "~> 1.6.7"
end