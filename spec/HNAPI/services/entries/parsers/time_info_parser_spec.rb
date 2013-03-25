require File.expand_path(File.dirname(__FILE__) + '/../../../../spec_helper')

module RubyHackernews
  describe TimeInfoParser do

    before :each do
      @parser = TimeInfoParser.new(stub(:text => " 4 hours ago  | "))
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

