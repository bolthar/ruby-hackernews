require File.expand_path(File.dirname(__FILE__) + '/../../../../spec_helper')
require File.expand_path(File.dirname(__FILE__) + '/parser_helper')

module RubyHackernews
  describe LinkInfoParser do

    before :each do
      @line          = ParserHelper.link_line
      @correct_title = "Flow chart: How to find out which things to throw out"
      @correct_link  = "http://mortenjust.com/2010/08/30/finding-out-which-things-to-throw-out/"
      @correct_site  = "mortenjust.com"
    end

    describe :parse do

      it "should call LinkInfo.new with correct title" do
        parser = LinkInfoParser.new(@line)
        LinkInfo.should_receive(:new).with(@correct_title, anything, anything)
        parser.parse
      end

      it "should call LinkInfo.new with correct link" do
        parser = LinkInfoParser.new(@line)
        LinkInfo.should_receive(:new).with(anything, @correct_link, anything)
        parser.parse
      end

      it "should call LinkInfo.new with correct site if site is present" do
        parser = LinkInfoParser.new(@line)
        LinkInfo.should_receive(:new).with(anything, anything, @correct_site)
        parser.parse
      end

      it "should call LinkInfo.new with nil if site is not present" do
        parser = LinkInfoParser.new(ParserHelper.link_line_no_site)
        LinkInfo.should_receive(:new).with(anything, anything, nil)
        parser.parse
      end

    end

  end
end

