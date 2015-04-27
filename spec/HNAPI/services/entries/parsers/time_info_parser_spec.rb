require 'spec_helper'
require File.join(File.dirname(__FILE__), 'parser_helper')

module RubyHackernews
  describe TimeInfoParser do

    before :each do
      @parser = TimeInfoParser.new(ParserHelper.second_line)
    end

    describe :parse do

      it "should pass the right value as the first parameter" do
        TimeInfo.should_receive(:new).with(4, anything)
        @parser.parse
      end

      it "should pass the right UoM descriptor as the second parameter" do
        TimeInfo.should_receive(:new).with(anything, "hours")
        @parser.parse
      end

    end
  end
end
