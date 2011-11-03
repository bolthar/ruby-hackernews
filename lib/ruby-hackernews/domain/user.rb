
class User

  attr_reader :name

  def initialize(name)
    @name = name
  end

  def login(password)
    return LoginService.new.login(@name, password)
  end

  def logout
    return LoginService.new.logout
  end
  
  def submissions(pages = 1)
    return UserInfoService.new.submissions(@name, pages)
  end
  
end