
class EntryPageParser

  def initialize(page)
    @page = page
  end

  def get_lines
    lines = @page.search("//table")[2].search("tr").select do |tr|
      tr['style'] !~ /height/ &&
      tr.children.first.attributes.count != 0
    end
    more_link = lines.last.search("a").first
    lines.pop if more_link && more_link.inner_html == "More"
    return lines
  end

  def get_next_url
    more_link = @page.search("//table")[2].search("tr/td/a").select { |node| node.inner_html == "More"}.first
    return more_link['href'] if more_link
    return nil
  end

end