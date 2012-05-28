module RubyHackernews

  class UserInfo

    attr_reader :name
    attr_reader :page

    def initialize(name, page)
      @name = name
      @page = page
    end

  end
 
end  
