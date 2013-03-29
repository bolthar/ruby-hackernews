require 'spec_helper'

#useless purely integration tests... remove?
module RubyHackernews
  describe EntryService do

    describe :get_entries do

      it "should always call EntryPageParser with current agent" do
        parser = stub()
        parser.should_receive(:get_lines).and_return([])
        parser.should_receive(:get_next_url).and_return(nil)
        agent = stub()
        agent.should_receive(:get).any_number_of_times.and_return(:page)
        MechanizeContext.create(:default, agent)
        service = EntryService.new
        EntryPageParser.should_receive(:new).any_number_of_times.with(:page).and_return(parser)
        service.get_entries
      end

      it "should always call get_lines 'pages' number of times" do
        pages  = 5
        parser = stub()
        parser.should_receive(:get_lines).exactly(pages).times.and_return([])
        parser.should_receive(:get_next_url).any_number_of_times.and_return(nil)
        agent = stub()
        agent.should_receive(:get).any_number_of_times.and_return(:page)
        MechanizeContext.create(:default, agent)
        service = EntryService.new
        EntryPageParser.should_receive(:new).any_number_of_times.with(:page).and_return(parser)
        service.get_entries(pages)
      end

      it "should always call get_next_url 'pages' number of times" do
        pages  = 5
        parser = stub()
        parser.should_receive(:get_lines).any_number_of_times.and_return([])
        parser.should_receive(:get_next_url).exactly(pages).times.and_return(nil)
        agent = stub()
        agent.should_receive(:get).any_number_of_times.and_return(:page)
        MechanizeContext.create(:default, agent)
        service = EntryService.new
        EntryPageParser.should_receive(:new).any_number_of_times.with(:page).and_return(parser)
        service.get_entries(pages)
      end

    end
  end
end

