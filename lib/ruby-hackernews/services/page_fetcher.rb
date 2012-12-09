
module RubyHackernews

  #acts as a cache
  class PageFetcher
    include MechanizeContext

    def initialize(page_url)
      @url = page_url
    end

    def page
      unless @page
        @page = agent.get(@url)
      end
      return @page
    end

  end
end
