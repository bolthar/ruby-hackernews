
class LoginService
  include MechanizeContext

  def login(username, password)    
    page = agent.get(ConfigurationService.base_url)
    login_url = page.search(".pagetop/a").last['href'].sub("/","")
    login_page = agent.get(ConfigurationService.base_url + login_url)
    form = login_page.forms.first
    form.u = username
    form.p = password
    page = form.submit
    return page.title != nil
  end

end