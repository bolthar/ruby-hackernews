
class User

  def login(name, password)
    if LoginService.new.login(name, password)
      @name = name
    end
    return @name
  end

  def logout
    if LoginService.new.logout
      @name = nil
    end
    return @name == nil
  end
end