
require File.expand_path(File.dirname(__FILE__) + '/../../../../spec_helper')
require File.expand_path(File.dirname(__FILE__) + '/parser_helper')

describe CommentsInfoParser do

  before(:each) do
    @line = ParserHelper.second_line
    @comment_link = "item?id=1645686"
  end

  describe :parse do

    it "should not call CommentsInfo.new if comment tag is missing" do
      parser = CommentsInfoParser.new(ParserHelper.second_line_comments_tag_missing)
      CommentsInfo.should_not_receive(:new)
      parser.parse
    end

    it "should call CommentsInfo.new with comments count if not 'discuss'" do
      parser = CommentsInfoParser.new(@line)
      CommentsInfo.should_receive(:new).with(2, anything)
      parser.parse
    end

    it "should call CommentsInfo.new with 0 if is 'discuss'" do
      parser = CommentsInfoParser.new(ParserHelper.second_line_no_comments_yet)
      CommentsInfo.should_receive(:new).with(0, anything)
      parser.parse
    end

    it "should call CommentsInfo.new with comment link" do
        parser = CommentsInfoParser.new(@line)
      CommentsInfo.should_receive(:new).with(anything, @comment_link)
      parser.parse
    end

  end

end

