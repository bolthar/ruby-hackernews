
class VotingInfoParser

  def initialize(voting_element, score_element)
    @voting_element   = voting_element
    @score_element    = score_element
  end

  def parse
    upvote   = @voting_element[0]['href'] if @voting_element[0]
    downvote = @voting_element[1]['href'] if @voting_element[1]
    score = @score_element.search("span")[0].inner_html.split[0].to_i
    return VotingInfo.new(score, upvote, downvote)
  end
end