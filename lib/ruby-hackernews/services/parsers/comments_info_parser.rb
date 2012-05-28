module RubyHackernews

  class CommentsInfoParser

    def initialize(comments_element)
      @element = comments_element.search("a")[1]
    end

    def parse
      comments_info = nil
      if @element && @element['href'] =~ /id/
        comments      = @element.inner_html.split[0].to_i
        comments_page = @element['href']
        comments_info = CommentsInfo.new(comments, comments_page)
      end
      return comments_info
    end

  end

end
