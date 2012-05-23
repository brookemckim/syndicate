# -*- encoding: utf-8 -*-
require File.expand_path('../lib/syndicate/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["brookemckim"]
  gem.email         = ["brooke.mckim@gmail.com"]
  gem.description   = %q{Easily watch videos hosted on your computer on any OTT device that can consume a MRSS feed.}
  gem.summary       = %q{Publish any directory as an MRSS feed.}
  gem.homepage      = "http://github.com/brookemckim/syndicate"

  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = "syndicate"
  gem.require_paths = ["lib"]
  gem.version       = Syndicate::VERSION
  
  gem.add_dependency 'puma', '~> 1.3.0'
  gem.add_dependency 'builder'
  gem.add_dependency 'sinatra', '~> 1.3.2'
end
