
class Entry

  attr_reader :number
  attr_reader :link
  attr_reader :voting
  attr_reader :user
  attr_reader :time

  def initialize(number, link, voting, user, comments, time)
    @number   = number
    @link     = link
    @voting   = voting
    @user     = user    
    @time     = time
    @comments_info = comments
  end

  def comments
    unless @comments
      @comments = CommentService.new.get_comments(@comments_info)
    end
    return @comments
  end

  def self.all(pages = 1)
    return EntryService.new.get_entries(pages)
  end



end