module RubyHackernews

  class TextService
    include MechanizeContext

    def get_text(page)
      return TextParser.new(page.search("table")[2]).parse
    end

  end
end  
