require 'spec_helper'

module RubyHackernews
  describe TimeInfo do

    before :all do
      class RubyHackernews::TimeInfo
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
        TimeInfo.new(15, "seconds").time.round.should == (Time.now - 15).round
      end

      it "should return right amount when passed minutes" do
        TimeInfo.new(24, "minutes").time.round.should == (Time.now - 24*60).round
      end

      it "should return right amount when passed hours" do
        TimeInfo.new(3, "hours").time.round.should == (Time.now - 3*3600).round
      end

      it "should return right amount when passed days" do
        TimeInfo.new(16, "days").time.round.should == (Time.now - 16*86400).round
      end

    end
  end
end

