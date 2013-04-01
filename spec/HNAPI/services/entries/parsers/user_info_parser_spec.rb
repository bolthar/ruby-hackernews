require 'spec_helper'
require File.expand_path(File.dirname(__FILE__) + '/parser_helper')

module RubyHackernews
  describe UserInfoParser do

    before :each do
      @parser = UserInfoParser.new(ParserHelper.second_line)
    end

    describe :parse do

      it "should pass the right user name" do
        UserInfo.should_receive(:new).with("johnthedebs", anything)
        @parser.parse
      end

      it "should pass the right user page" do
        UserInfo.should_receive(:new).with(anything, "user?id=johnthedebs")
        @parser.parse
      end

    end
  end
end

