module RubyHackernews

  class CommentService
    include MechanizeContext

    def get_comments(page)
      table = page.search("table")[3]
      return get_comments_entities(table)
    end

    def get_user_comments(user)
      page = agent.get(ConfigurationService.base_url + "threads?id=#{user.name}")
      table = page.search("table")[2]
      return get_comments_entities(table)
    end

    def find_by_id(id)
      page = agent.get(ConfigurationService.base_url + "item?id=#{id}")
      comment = parse_comment(page.search("table")[2].search("tr").first)
      comment.instance_variable_set(:@absolute_link, "item?id=#{id}")
      get_comments_entities(page.search("table")[3]).each do |c|
        comment << c
      end
      return comment
    end

    def get_comments_entities(table)
      comments = []
      target   = comments
      current_level = 0
      trs = table.search("table/tr").select do |tr|
        tr.search("span.comment").inner_html != "[deleted]"
      end
      trs.each do |tr|
        comment = parse_comment(tr)
        level = tr.search("img[@src='s.gif']").first['width'].to_i / 40
        difference = current_level - level
        (difference + 1).times do
          target = target.kind_of?(Comment) && target.parent ? target.parent : comments
        end
        current_level = level
        target << comment
        target = comment
      end
      return comments
    end

    def get_new_comments(pages = 1, url = ConfigurationService.comments_url)
      get_new_comments_with_extra(pages,url)[:comments]
    end

    def get_new_comments_with_extra(pages = 1, url = ConfigurationService.comments_url)
      parser = EntryPageParser.new(agent.get(url))
      comments = []
      next_url = nil
      pages.times do
        lines = parser.get_lines
        lines.each do |line|
          comments << parse_comment(line)
        end
        next_url = parser.get_next_url || break
        parser = EntryPageParser.new(agent.get(next_url))
      end
      return {:comments => comments, :next_url => next_url}
    end

    def parse_comment(element)
      text_html = ""
      element.search("span.comment").first.children.each do |ch|
        text_html = ch.inner_html
      end
      header = element.search("span.comhead").first
      voting = VotingInfoParser.new(element.search("td/center/a"), header).parse
      user_info = UserInfoParser.new(header).parse
      reply_link = element.search("td[@class='default']/p//u//a").first
      reply_url = reply_link['href'] if reply_link
      absolute_link_group = header.search("a")
      absolute_url = absolute_link_group.count == 2 ? absolute_link_group[1]['href'] : nil
      parent_link = header.search("a[text()*='parent']").first
      parent_url = parent_link['href'] if parent_link
      return Comment.new(text_html, voting, user_info, reply_url, absolute_url, parent_url)
    end

    def write_comment(page_url, comment)
      require_authentication
      form = agent.get(page_url).forms.first
      form.text = comment
      form.submit
      return true
    end

  end
end  
