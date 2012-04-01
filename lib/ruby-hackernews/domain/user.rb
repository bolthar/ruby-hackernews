
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

  def signup(password)
    return SignupService.new.signup(@name, password)
  end
  
  def submissions(pages = 1)
    return UserInfoService.new.submissions(@name, pages)
  end
  
  def saved(pages = 1)
    return UserInfoService.new.saved(@name, pages)
  end
  
  def comments(pages = 1)
    return UserInfoService.new.comments(@name, pages)
  end
  
end
