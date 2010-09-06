
class UserInfoParser

  def initialize(user_element)
    @element = user_element
  end

  def parse
    user_name = @element.search("a")[0].inner_html
    user_page = @element.search("a")[0]['href']
    return UserInfo.new(user_name, user_page)
  end
end