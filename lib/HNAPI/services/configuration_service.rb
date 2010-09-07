
class ConfigurationService

  def self.base_url
    return "http://news.ycombinator.com/"
  end

  def self.new_url
    return File.join(self.base_url, "newest")
  end

  def self.ask_url
    return File.join(self.base_url, "ask")
  end

  def self.jobs_url
    return File.join(self.base_url, "jobs")
  end

  def self.comments_url
    return File.join(self.base_url, "newcomments")
  end

end