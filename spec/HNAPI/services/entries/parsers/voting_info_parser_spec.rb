require 'spec_helper'
require File.expand_path(File.dirname(__FILE__) + '/parser_helper')

module RubyHackernews
  describe VotingInfoParser do

    before :each do
      @voting_element    = ParserHelper.voting_node
      @score_element     = ParserHelper.second_line
      @correct_vote_link = "vote?for=1645686&dir=up&whence=%6e%65%77%73"
    end

    describe :parse do

      it "should assign link.href to upvote if element not nil" do
        parser = VotingInfoParser.new(@voting_element, @score_element)
        VotingInfo.should_receive(:new).with(anything, @correct_vote_link, anything)
        parser.parse
      end

      it "should assing nil to upvote if element nil" do
        parser = VotingInfoParser.new(ParserHelper.voting_node_no_upvote, @score_element)
        VotingInfo.should_receive(:new).with(anything, nil, anything)
        parser.parse
      end

      it "should assing link.href to downvote if element not nil" do
        parser = VotingInfoParser.new(@voting_element, @score_element)
        VotingInfo.should_receive(:new).with(anything, anything, @correct_vote_link)
        parser.parse
      end

      it "should assing nil to downvote if element nil" do
        parser = VotingInfoParser.new(ParserHelper.voting_node_no_downvote, @score_element)
        VotingInfo.should_receive(:new).with(anything, anything, nil)
        parser.parse
      end

      it "should assing correct score to score" do
        parser = VotingInfoParser.new(@voting_element, @score_element)
        VotingInfo.should_receive(:new).with(17, anything, anything)
        parser.parse
      end
    end

  end
end

