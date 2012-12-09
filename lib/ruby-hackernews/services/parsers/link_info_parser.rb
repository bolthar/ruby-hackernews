module RubyHackernews

  class LinkInfoParser

    def initialize(link_element, link_text = nil)
      @element   = link_element
      @link_text = link_text
    end

    def parse
      link   = @element.search("a")[0]['href']
      title  = @element.search("a")[0].inner_html
      site_element = @element.search("span")
      site = site_element.inner_html.sub("(","").sub(")","").strip if site_element.any?
      
      if link_text == nil
        return LinkInfo.new(title, link, site)
      else
        return LinkInfo.new(title, link, site, link_text)
      end
    end

  end

end
