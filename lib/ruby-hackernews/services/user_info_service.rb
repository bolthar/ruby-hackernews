module RubyHackernews

  class UserInfoService
    include MechanizeContext

    def submissions(username, pages = 1)
      page_url = ConfigurationService.base_url + 'submitted?id=' + username
      return EntryService.new.get_entries(pages, page_url)
    end

    def saved(username, pages = 1)
      require_authentication
      page_url = ConfigurationService.base_url + 'saved?id=' + username
      return EntryService.new.get_entries(pages, page_url)
    end
    
    ##This doesn't work, need a new commentService to handle the user comment page
    def comments(username, pages = 1)
      page_url = ConfigurationService.base_url + 'threads?id=' + username
      return CommentService.new.get_new_comments(pages,page_url)    
    end
      
  end

end
