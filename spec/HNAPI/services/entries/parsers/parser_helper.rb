
class ParserHelper

  #upvote:   vote?for=1645686&dir=up&whence=%6e%65%77%73
  #downvote: nil
  def self.voting_node_no_downvote
    return Nokogiri::HTML.fragment('<a id=up_1645686 href="vote?for=1645686&dir=up&whence=%6e%65%77%73"><img src="http://ycombinator.com/images/grayarrow.gif" border=0 vspace=3 hspace=2></a><span id=down_1645686></span>'
      ).children
  end

  #upvote:   nil
  #downvote: vote?for=1645686&dir=up&whence=%6e%65%77%73
  def self.voting_node_no_upvote
    return Nokogiri::HTML.fragment('<span id=up_1645686></span><a id=down_1645686 href="vote?for=1645686&dir=up&whence=%6e%65%77%73"><img src="http://ycombinator.com/images/grayarrow.gif" border=0 vspace=3 hspace=2></a>'
      ).children
  end

  #upvote:   vote?for=1645686&dir=up&whence=%6e%65%77%73
  #downvote: vote?for=1645686&dir=up&whence=%6e%65%77%73
  def self.voting_node
    return Nokogiri::HTML.fragment('<a id=up_1645686 href="vote?for=1645686&dir=up&whence=%6e%65%77%73"><img src="http://ycombinator.com/images/grayarrow.gif" border=0 vspace=3 hspace=2></a><a id=down_1645686 href="vote?for=1645686&dir=up&whence=%6e%65%77%73"><img src="http://ycombinator.com/images/grayarrow.gif" border=0 vspace=3 hspace=2></a>'
    ).children
  end

  #username     : johnthedebs
  #user page    : user?id=johnthedebs
  #score        : 17
  #comments     : 2
  #comment_page : item?id=1645686
  def self.second_line
    return Nokogiri::HTML.fragment('<td class="subtext"><span class="score" id="score_1645686">17 points</span> by <a href="user?id=johnthedebs">johnthedebs</a> <a href="item?id=1645686">4 hours ago</a> | <a href="item?id=1645686">2 comments</a></td>')
  end

  #username     : johnthedebs
  #user page    : user?id=johnthedebs
  #score        : 17
  #comment_page : item?id=1645686
  def self.second_line_no_comments_yet
    return Nokogiri::HTML.fragment('<td colspan="2"></td><td class="subtext"><span class="score" id="score_1645686">17 points</span> by <a href="user?id=johnthedebs">johnthedebs</a> <a href="item?id=1645686">4 hours ago</a> | <a href="item?id=1645686">discuss</a></td>')
  end

  #username     : johnthedebs
  #user page    : user?id=johnthedebs
  #score        : 17
  def self.second_line_comments_tag_missing
    return Nokogiri::HTML.fragment('<td class="subtext"><span id=score_1645686>17 points</span> by <a href="user?id=johnthedebs">johnthedebs</a> 4 hours ago</td>')
  end

  #title : Flow chart: How to find out which things to throw out
  #link  : http://mortenjust.com/2010/08/30/finding-out-which-things-to-throw-out/
  #site  :  (mortenjust.com)
  def self.link_line
    return Nokogiri::HTML('<td class="title"><a href="http://mortenjust.com/2010/08/30/finding-out-which-things-to-throw-out/" rel="nofollow">Flow chart: How to find out which things to throw out</a><span class="comhead"> (mortenjust.com) </span></td>')
  end

  #title : Flow chart: How to find out which things to throw out
  #link  : http://mortenjust.com/2010/08/30/finding-out-which-things-to-throw-out/
  def self.link_line_no_site
    return Nokogiri::HTML('<td class="title"><a href="http://mortenjust.com/2010/08/30/finding-out-which-things-to-throw-out/" rel="nofollow">Flow chart: How to find out which things to throw out</a></td>')
  end

  def self.first_line_full
    return Nokogiri::HTML('<tr><td align=right valign=top class="title">2.</td><td><center><a id=up_1645745 href="vote?for=1645745&dir=up&whence=%6e%65%77%73"><img src="http://ycombinator.com/images/grayarrow.gif" border=0 vspace=3 hspace=2></a><span id=down_1645745></span></center></td><td class="title"><a href="http://technologizer.com/2010/08/18/the-tragic-death-of-practically-everything/">The Tragic Death of Practically Everything</a><span class="comhead"> (technologizer.com) </span></td></tr>')
  end

  def self.second_line_full
    Nokogiri::HTML.fragment('<tr><td colspan=2></td><td class="subtext"><span class="score" id="score_1645745">59 points</span> by <a href="user?id=dhotson">dhotson</a> <a href="item?id=1645745">4 hours ago</a> | <a href="item?id=1645745">5 comments</a></td></tr>')
  end

  def self.full_page
    File.open(File.join(File.dirname(__FILE__), 'hn_test_page.html'), 'r') do |file|
      return Nokogiri::HTML(file)
    end

  end

end
