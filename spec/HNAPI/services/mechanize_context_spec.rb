require 'spec_helper'

module RubyHackernews
  describe MechanizeContext do

    before :each do
      MechanizeContext.send(:class_variable_set, :@@contexts, nil)
      MechanizeContext.send(:class_variable_set, :@@default, nil)
    end

    describe "create" do

      it "should instantiate class variable on use" do
        MechanizeContext.create()
        MechanizeContext.send(:class_variable_get, :@@contexts).should_not be_nil
      end

      it "should assign new agent to hash[key]" do
        MechanizeContext.create(:test_key)
        MechanizeContext.send(:class_variable_get, :@@contexts)[:test_key].should be_kind_of Mechanize
      end

      it "should assign new agent to default if no key passed" do
        MechanizeContext.create
        MechanizeContext.send(:class_variable_get, :@@contexts)[:default].should be_kind_of Mechanize
      end

    end

    describe "agent=" do

      it "should set @@default as passed key" do
        MechanizeContext.agent = :test_agent
        MechanizeContext.send(:class_variable_get, :@@default).should == :test_agent
      end

    end

    describe "agent" do

      it "should return the @@default agent" do
        MechanizeContext.send(:class_variable_set, :@@default, :test_value)
        MechanizeContext.send(:class_variable_set, :@@contexts, {:test_value => :target})
        klass = Class.new
        klass.instance_eval do
          include MechanizeContext
        end
        klass.new.agent.should == :target
      end

    end

    describe "[]" do

      it "should return the [key] agent" do
        MechanizeContext.send(:class_variable_set, :@@contexts, {:test_value => :target})
        klass = Class.new
        klass.instance_eval do
          include MechanizeContext
        end
        klass.new[:test_value].should == :target
      end

    end
  end
end

