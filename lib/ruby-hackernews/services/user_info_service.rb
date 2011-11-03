
class UserInfoService
  include MechanizeContext

  def submissions(username, pages = 1)
    require_authentication
    page_url = ConfigurationService.base_url + 'submitted?id=' + username
    return EntryService.new.get_entries(pages, page_url)
  end

end