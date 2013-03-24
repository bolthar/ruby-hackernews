require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

module RubyHackernews
  describe TimeInfo do

    before :all do
      TimeInfo.instance_eval do
        DUMMY = 10
      end
    end

    describe :initialize do

      it "should set unit_of_measure as uppercase descriptor const if singular" do
        timeinfo = TimeInfo.new(5, "dummy")
        timeinfo.instance_variable_get(:@unit_of_measure).should == 10
      end

      it "should set unit_of_measure as uppercase minus last s descriptor const if plural" do
        timeinfo = TimeInfo.new(5, "dummys")
        timeinfo.instance_variable_get(:@unit_of_measure).should == 10
      end

    end

    describe :time do

      it "should return right amount when passed seconds" do
        TimeInfo.new(15, "seconds").time.should == Time.at(15)
      end

      it "should return right amount when passed minutes" do
        TimeInfo.new(24, "minutes").time.should == Time.at(24*60)
      end

      it "should return right amount when passed hours" do
        TimeInfo.new(3, "hours").time.should == Time.at(3*3600)
      end

      it "should return right amount when passed days" do
        TimeInfo.new(16, "days").time.should == Time.at(16*86400)
      end

    end
  end
end

