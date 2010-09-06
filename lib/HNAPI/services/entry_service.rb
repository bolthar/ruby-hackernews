
class EntryService
  include MechanizeContext

  def get_entries(pages = 1)
    parser = EntryPageParser.new(agent.get(ConfigurationService.base_url))
    entry_infos = []
    pages.times do
      lines = parser.get_lines
      (lines.length / 2).times do
        entry_infos << EntryParser.new(lines.shift, lines.shift).parse
      end
      parser = EntryPageParser.new(agent.get(parser.get_next_url))
    end
    return entry_infos
  end  
  
end