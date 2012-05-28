module RubyHackernews

  class VotingService
    include MechanizeContext

    def vote(url)
      require_authentication
      agent.get(url)
      return true
    end

  end

end
