
class SignupService
  include MechanizeContext

  def signup(username, password)
    raise "You are logged in already - logout first." if authenticated?
    page = agent.get(ConfigurationService.base_url)
    login_url = page.search(".pagetop/a").last['href'].sub("/","")
    login_page = agent.get(ConfigurationService.base_url + login_url)
    form = login_page.forms[1]
    form.u = username
    form.p = password
    page = form.submit
    return page.title != nil
  end

end
