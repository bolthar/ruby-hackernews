
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
      @comments = CommentService.new.get_comments(@comments_info.page)
    end
    return @comments
  end

  def self.all(pages = 1)
    return EntryService.new.get_entries(pages)
  end

  def self.newest(pages = 1)
    return EntryService.new.get_new_entries(pages)
  end

  def self.questions(pages = 1)
    return EntryService.new.get_questions(pages)
  end

  def self.jobs(pages = 1)
    return EntryService.new.get_jobs(pages)
  end

  def write_comment(text)
    return CommentService.new.write_comment(@comments_info.page, text)
  end

  def self.submit(*args)
    return EntryService.new.submit(*args)
  end

  def upvote
    return VotingService.new.vote(@voting.upvote)
  end

end