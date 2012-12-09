module RubyHackernews

  class LinkInfo

    attr_reader :title
    attr_reader :href
    attr_reader :site

    def initialize(title, href, site, text = nil)
      @title = title
      @href  = href
      @site  = site
      @text  = text
    end

  end

end
