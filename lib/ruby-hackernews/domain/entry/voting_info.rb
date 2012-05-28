module RubyHackernews

  class VotingInfo

    attr_reader :score
    attr_reader :upvote
    attr_reader :downvote

    def initialize(score, upvote, downvote)
      @score    =  score
      @upvote   = upvote
      @downvote = downvote
    end

  end

end  
