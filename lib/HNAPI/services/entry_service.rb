
class EntryService
  include MechanizeContext

  def get_entries(pages = 1, url = ConfigurationService.base_url)
    parser = EntryPageParser.new(agent.get(url))
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

  def get_new_entries(pages = 1)
    return get_entries(pages, ConfigurationService.new_url)
  end

  def get_questions(pages = 1)
    return get_entries(pages, ConfigurationService.ask_url)
  end

  def get_jobs(pages = 1)
    return get_entries(pages, ConfigurationService.jobs_url)
  end
  
end