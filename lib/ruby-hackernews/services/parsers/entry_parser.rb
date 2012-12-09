module RubyHackernews

  class EntryParser

    def initialize(first_line, second_line, third_line = nil)
      @first_line  = first_line
      @second_line = second_line
      @third_line  = third_line
    end

    def parse
      first_line_title = @first_line.search("[@class='title']")
      number_segment = nil
      link_segment = nil
      if(first_line_title.length > 1)
        number_segment = first_line_title[0]
        link_segment = first_line_title[1]
      else
        link_segment = first_line_title[0]
      end
      number   = number_segment.inner_html.sub(".","").to_i if number_segment
      link     = LinkInfoParser.new(link_segment, third_line).parse
      voting   = VotingInfoParser.new(@first_line.search("td/center/a"), @second_line.search("[@class='subtext']")[0]).parse
      user     = UserInfoParser.new(@second_line.search("[@class='subtext']")[0]).parse
      comments = CommentsInfoParser.new(@second_line.search("[@class='subtext']")[0]).parse
      time     = TimeInfoParser.new(@second_line.search("[@class='subtext']").children[3]).parse
      return Entry.new(number, link, voting, user, comments, time)
    end
    
  end

end
