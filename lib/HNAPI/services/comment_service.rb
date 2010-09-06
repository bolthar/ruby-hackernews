
class CommentService
  include MechanizeContext

  def get_comments(comments_info)
    comments = []
    last   = comments
    current_level = -1
    page = agent.get(comments_info.page)
    page.search("//table")[3].search("table/tr").select do |tr|
      tr.search("span.comment").inner_html != "[deleted]"
    end.each do |tr|
      text = ""
      tr.search("span.comment").first.children.each do |ch|
        text = ch.inner_html.gsub(/<.{1,2}>/,"")
      end
      reply_link = tr.search("td[@class='default']/p//u//a").first['href']
      header = tr.search("span.comhead").first
      score = header.search("span").first.inner_html.split[0].to_i      
      user_info = UserInfoParser.new(header).parse
      level = tr.search("img[@src='http://ycombinator.com/images/s.gif']").first['width'].to_i / 40
      comment = Comment.new(text, score, user_info, reply_link)
      difference = current_level - level
      target = last
      (difference + 1).times do
        target = target.parent || comments
      end
      target << comment
      last = comment
      current_level = level
    end
    return comments
  end

  def write_comment
    require_authentication
    
  end

end