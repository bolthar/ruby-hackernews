module RubyHackernews

  class Entry

    attr_reader :number
    attr_reader :link
    attr_reader :voting
    attr_reader :user

    def initialize(number, link, voting, user, comments, time)
      @number   = number
      @link     = link
      @voting   = voting
      @user     = user    
      @time     = time
      @comments_info = comments
      @cache    = PageFetcher.new(@comments_info.page) if @comments_info
    end

    def text
      unless @text
        @text = TextService.new.get_text(@cache.page)
      end
      return @text
    end

    def comments
      unless @comments
        @comments = CommentService.new.get_comments(@cache.page)
      end
      return @comments
    end

    def self.all(pages = 1)
      return EntryService.new.get_entries(pages)
    end

    def self.newest(pages = 1)
      return EntryService.new.get_new_entries(pages)
    end

    def self.newest_with_extra(pages = 1, url = nil)
      args = [pages]
      args << url unless url.nil?
      return EntryService.new.get_entries_with_extra *args
    end

    def self.questions(pages = 1)
      return EntryService.new.get_questions(pages)
    end

    def self.jobs(pages = 1)
      return EntryService.new.get_jobs(pages)
    end

    def self.find(id)
      return EntryService.new.find_by_id(id)
    end

    def time
      return @time.time
    end

    def id
      return @comments_info ? @comments_info.id : nil
    end
    
    def comments_url
      return @comments_info ? ConfigurationService.base_url + @comments_info.url : nil
    end

    def comments_count
      return @comments_info.count unless @comments_info.nil?
    end

    def write_comment(text)
      return CommentService.new.write_comment(@comments_info.page, text)
    end

    def self.submit(title, url)
      return EntryService.new.submit(title, url)
    end

    def self.ask(title, text)
      return EntryService.new.ask(title, text)
    end

    def upvote
      return VotingService.new.vote(@voting.upvote)
    end

  end

end  
