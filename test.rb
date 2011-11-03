require File.expand_path(File.dirname(__FILE__) + '/lib/ruby-hackernews.rb')

user = User.new("pg")
puts user.comments
#puts Comment.newest.count
