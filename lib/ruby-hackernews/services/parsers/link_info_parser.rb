module RubyHackernews

  class LinkInfoParser

    def initialize(link_element)
      @element = link_element
    end

    def parse
      link   = @element.search("a")[0]['href']
      title  = @element.search("a")[0].inner_html
      site_element = @element.search("span")
      site = site_element.inner_html.sub("(","").sub(")","").strip if site_element.any?
      return LinkInfo.new(title, link, site)
    end

  end

end
