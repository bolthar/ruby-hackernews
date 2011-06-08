
class UserInfoParser

  def initialize(user_element)
    @element = user_element
  end

  def parse
    user_element = @element.search("a")[0]
    if user_element
      user_name = user_element.inner_html
      user_page = user_element['href']
    end
    return UserInfo.new(user_name, user_page)
  end
end