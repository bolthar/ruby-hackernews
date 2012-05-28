
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
      next_url = parser.get_next_url || break
      parser = EntryPageParser.new(agent.get(next_url))
    end
    return entry_infos
  end

  def find_by_id(id)
    page = agent.get(ConfigurationService.base_url + "item?id=#{id}")
    lines = page.search("table")[2].search("tr")
    return EntryParser.new(lines[0], lines[1]).parse
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
  
  def submit(title, url)
    require_authentication
    form = agent.get(ConfigurationService.submit_url).forms.first
    submit_link(form, title, url)
    return true
  end

  def ask(title, text)
    require_authentication
    form = agent.get(ConfigurationService.submit_url).forms.first
    submit_question(form, title, text)
    return true
  end

  private
  def submit_link(form, title, url)
    form.t = title
    form.u = url
    form.submit
  end

  def submit_question(form, title, text)
    form.t = title
    form.x = text
    form.submit
  end

  
end
