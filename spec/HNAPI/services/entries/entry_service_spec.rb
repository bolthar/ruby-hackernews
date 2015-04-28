require 'spec_helper'

#useless purely integration tests... remove?
module RubyHackernews
  describe EntryService do

    describe :get_entries do

      it "should always call EntryPageParser with current agent" do
        parser = Object.new
        allow(parser).to receive_messages(:get_lines => [], :get_next_url => nil)
        agent = Object.new
        allow(agent).to receive_messages(:get => :page)
        MechanizeContext.send(:class_variable_set, :@@contexts, {:default => agent})
        service = EntryService.new
        expect(EntryPageParser).to receive(:new).at_least(1).with(:page).and_return(parser)
        service.get_entries
      end

      it "should always call get_lines 'pages' number of times" do
        pages  = 5
        parser = Object.new
        expect(parser).to receive(:get_lines).and_return([])
        allow(parser).to receive(:get_next_url).and_return(nil)
        agent = Object.new
        allow(agent).to receive_messages(:get => :page)
        MechanizeContext.send(:class_variable_set, :@@contexts, {:default => agent})
        service = EntryService.new
        allow(EntryPageParser).to receive(:new).with(:page).and_return(parser)
        service.get_entries
      end

      it "should always call get_next_url 'pages' number of times" do
        parser = Object.new
        allow(parser).to receive(:get_lines).and_return([])
        expect(parser).to receive(:get_next_url).and_return(nil)
        agent = Object.new
        allow(agent).to receive_messages(:get => :page)
        MechanizeContext.send(:class_variable_set, :@@contexts, {:default => agent})
        service = EntryService.new
        allow(EntryPageParser).to receive(:new).with(:page).and_return(parser)
        service.get_entries
      end

    end
  end
end

