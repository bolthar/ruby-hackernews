
class EntryPageParser

  def initialize(page)
    @page = page
  end

  def get_lines
    lines = @page.search("//table")[2].search("tr").select do |tr|
      tr['style'] !~ /height/
    end
    lines.pop
    return lines
  end

  def get_next_url
    return @page.search("//table")[2].search("tr/td/a").select { |node| node.inner_html == "More"}.first["href"]
  end

end