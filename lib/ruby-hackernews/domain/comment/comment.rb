module RubyHackernews

  class Comment
    include Enumerable

    attr_reader :text
    attr_reader :voting
    attr_reader :user

    attr_accessor :parent

    def initialize(text, voting, user_info, reply_link)
      @text = text
      @voting = voting
      @user = user_info
      @reply_link = reply_link
      @children = []
    end

    def <<(comment)
      comment.parent = self
      @children << comment
    end

    def each(&block)
      @children.each(&block)
    end

    def <=>(other_comment)
      return other_comment.voting.score <=> @voting.score
    end

    def method_missing(method, *args, &block)
      @children.send(method, *args, &block)
    end

    def self.newest(pages = 1)
      return CommentService.new.get_new_comments(pages)
    end

    def reply(text)
      return false unless @reply_link
      CommentService.new.write_comment(@reply_link, text)
      return true
    end

    def upvote
      VotingService.new.vote(@voting.upvote)
    end

    def downvote
      VotingService.new.vote(@voting.downvote)
    end

  end
 
end  
