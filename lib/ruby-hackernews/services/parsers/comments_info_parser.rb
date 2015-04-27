module RubyHackernews

  class CommentsInfoParser

    def initialize(second_line)
      @second_line = second_line
    end

    def parse
      return unless comments_link

      comments      = comments_link.text.split[0].to_i
      comments_page = comments_link['href']

      CommentsInfo.new(comments, comments_page)
    end

    private

    def comments_link
      links.find { |link| link.text =~ /comment|discuss/ }
    end

    def links
      @second_line.css('a')
    end

  end

end
