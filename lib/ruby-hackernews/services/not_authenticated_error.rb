module RubyHackernews

  class NotAuthenticatedError < StandardError

    def message
      return "You need to authenticate before making this operation"
    end
    
  end

end
