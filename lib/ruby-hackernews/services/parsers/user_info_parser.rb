module RubyHackernews

  class UserInfoParser

    def initialize(second_line)
      @second_line = second_line
    end

    def parse
      return unless user_link

      user_name = user_link.inner_html
      user_page = user_link['href']

      UserInfo.new(user_name, user_page)
    end

    private

    def user_link
      links.find { |link| link['href'] =~ /user\?id=/ }
    end

    def links
      @second_line.css('a')
    end

  end

end
