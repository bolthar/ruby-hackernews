module RubyHackernews

  class CommentsInfo

    attr_accessor :count
    attr_reader :page

    def initialize(count, page)
      @count = count
      @page  = page
    end

    def id  
      return page[/\d+/]
    end
    
    def url
      return page
    end

  end

end
