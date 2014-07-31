module RubyHackernews

  class ConfigurationService

    def self.base_url=(url)
      @base_url = url
    end

    def self.base_url
      return @base_url || "http://news.ycombinator.com/"
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

    def self.show_url
      return File.join(self.base_url, "show")
    end

    def self.new_shows_url
      return File.join(self.base_url, "shownew")
    end

    def self.comments_url
      return File.join(self.base_url, "newcomments")
    end

    def self.submit_url
      return File.join(self.base_url, "submit")
    end

  end

end
