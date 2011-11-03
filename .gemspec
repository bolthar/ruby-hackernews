spec = Gem::Specification.new do |s|
  s.name = 'ruby-hackernews'
  s.version = '1.1.3'
  s.add_dependency('require_all', '>= 1.1.0')
  s.add_dependency('mechanize', '>= 1.0.0')
  s.has_rdoc = false
  s.homepage = "http://github.com/blissofbeing/ruby-hackernews"
  s.summary = 'An interface to Hacker News'
  s.description = s.summary
  s.author = 'Andrea Dallera'
  s.email = 'andrea@andreadallera.com'
  s.files = %w(README.rdoc Rakefile) + Dir.glob("{lib}/**/*")
  s.require_path = "lib"  
end