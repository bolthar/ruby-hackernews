
require 'rubygems'
require 'mechanize'

require 'require_all'

require_all File.join(File.dirname(__FILE__), 'ruby-hackernews', 'domain')
require_all File.join(File.dirname(__FILE__), 'ruby-hackernews', 'services')

entries = Entry.all(2)

entries.each do |entry|
  p entry.id, entries.index(entry)
end
