
class LinkInfo

  attr_reader :title
  attr_reader :href
  attr_reader :site

  def initialize(title, href, site)
    @title = title
    @href  = href
    @site  = site
  end

end