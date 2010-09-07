
class EntryPageParser

  def initialize(page)
    @page = page
  end

  def get_lines
    lines = @page.search("//table")[2].search("tr").select do |tr|
      tr['style'] !~ /height/ && 
      (tr.children.first['class'] || tr.children.first['colspan'])
    end
    lines.pop unless lines.last.children.first['colspan']
    return lines
  end

  def get_next_url
    more_link = @page.search("//table")[2].search("tr/td/a").select { |node| node.inner_html == "More"}.first
    return more_link['href'] if more_link
    return nil
  end

end