
class LoginService
  include MechanizeContext

  def login(username, password)
    raise "You are logged in already - logout first." if authenticated?
    page = agent.get(ConfigurationService.base_url)
    login_url = page.search(".pagetop/a").last['href'].sub("/","")
    login_page = agent.get(ConfigurationService.base_url + login_url)
    form = login_page.forms.first
    form.u = username
    form.p = password
    page = form.submit
    return page.title != nil
  end

  def logout
    require_authentication
    page = agent.get(ConfigurationService.base_url)
    login_url = page.search(".pagetop/a").last['href'].sub("/","")
    logout_page = agent.get(ConfigurationService.base_url + login_url)
    agent.cookie_jar.jar.clear
    return logout_page.search(".pagetop/a").last.inner_html == "login"
  end

end