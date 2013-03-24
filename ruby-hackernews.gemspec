# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'ruby-hackernews/version'

Gem::Specification.new do |spec|
  spec.name          = "ruby-hackernews"
  spec.version       = RubyHackernews::VERSION
  spec.authors       = ["Andrea Dallera"]
  spec.email         = ["andrea@andreadallera.com"]
  spec.description   = %q{An interface to Hacker News}
  spec.summary       = %q{An interface to Hacker News}
  spec.homepage      = "http://github.com/blissofbeing/ruby-hackernews"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.has_rdoc = false

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"

  spec.add_dependency('require_all', '>= 1.1.0')
  spec.add_dependency('mechanize', '>= 1.0.0')
end
