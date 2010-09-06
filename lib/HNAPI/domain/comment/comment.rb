
class Comment
  include Enumerable

  attr_reader :text
  attr_reader :score
  attr_reader :user

  attr_accessor :parent
  attr_reader :children

  def initialize(text, score, user_info, reply_link)
    @text = text
    @score = score
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
    return other_comment.score <=> @score
  end

  def method_missing(method, *args, &block)
    @children.send(method, *args, &block)
  end

end
