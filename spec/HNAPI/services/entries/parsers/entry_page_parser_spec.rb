require File.expand_path(File.dirname(__FILE__) + '/../../../../spec_helper')
require File.expand_path(File.dirname(__FILE__) + '/parser_helper')

module RubyHackernews
  describe EntryPageParser do

    before :each do
      @page = ParserHelper.full_page
    end

    describe :get_lines do
      it "should always return 60 elements" do
        lines = EntryPageParser.new(@page).get_lines
        lines.length.should == 60
      end
    end

    describe :get_next_url do
      it "should get the url in 'More' element" do
        url = EntryPageParser.new(@page).get_next_url
        url.should == "/x?fnid=9LO1ba1swy"
      end
    end

  end
end
