require File.expand_path(File.dirname(__FILE__) + '/../../../../spec_helper')
require File.expand_path(File.dirname(__FILE__) + '/parser_helper')

module RubyHackernews
  describe EntryParser do

    before(:each) do
      @first_line  = ParserHelper.first_line_full
      @second_line = ParserHelper.second_line_full
    end

    describe :parse do

      it "should call Entry.new with the right number" do
        parser = EntryParser.new(@first_line, @second_line)
        Entry.should_receive(:new).with(2, anything, anything, anything, anything, anything)
        parser.parse
      end

      it "should return an entry with correct link" do
        parser = EntryParser.new(@first_line, @second_line)
        entry  = parser.parse
        entry.link.title.should == "The Tragic Death of Practically Everything"
        entry.link.href.should == "http://technologizer.com/2010/08/18/the-tragic-death-of-practically-everything/"
        entry.link.site.should == "technologizer.com"
      end

      it "should return an entry with correct voting" do
        parser = EntryParser.new(@first_line, @second_line)
        entry  = parser.parse
        entry.voting.upvote.should == "vote?for=1645745&dir=up&whence=%6e%65%77%73"
        entry.voting.downvote.should be_nil
        entry.voting.score.should == 59
      end

      it "should return an entry with correct user" do
        parser = EntryParser.new(@first_line, @second_line)
        entry  = parser.parse
        entry.user.name.should == "dhotson"
        entry.user.page.should == "user?id=dhotson"
      end

      it "should return an entry with correct time" do
        parser = EntryParser.new(@first_line, @second_line)
        entry  = parser.parse
        entry.time.time.should == Time.at(3600*4)
      end

    end

  end
end

