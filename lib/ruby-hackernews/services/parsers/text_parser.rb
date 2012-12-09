
module RubyHackernews

  class TextParser

    def initialize(table)
      @target_line = table.search("tr")[3]
    end

    def parse
      return @target_line.search("td")[1].inner_text
    end

  end
end
