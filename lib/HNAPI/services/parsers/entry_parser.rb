
class EntryParser

  def initialize(first_line, second_line)
    @first_line  = first_line
    @second_line = second_line
  end

  def parse
    number   = @first_line.search("[@class='title']")[0].inner_html.sub(".","").to_i
    link     = LinkInfoParser.new(@first_line.search("[@class='title']")[1]).parse
    voting   = VotingInfoParser.new(@first_line.search("td/center/a"), @second_line.search("[@class='subtext']")[0]).parse
    user     = UserInfoParser.new(@second_line.search("[@class='subtext']")[0]).parse
    comments = CommentsInfoParser.new(@second_line.search("[@class='subtext']")[0]).parse
    time     = TimeInfoParser.new(@second_line.search("[@class='subtext']").children[3]).parse
    return Entry.new(number, link, voting, user, comments, time)
  end
  
end