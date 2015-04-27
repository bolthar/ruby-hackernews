module RubyHackernews

  class TimeInfoParser

    def initialize(second_line)
      @second_line = second_line
    end

    def parse
      return unless time_link

      value           = time_link.text.strip.split[0].to_i
      unit_of_measure = time_link.text.strip.split[1]

      TimeInfo.new(value, unit_of_measure)
    end

    private

    def time_link
      links.find { |link| link.text =~ /\sago/ }
    end

    def links
      @second_line.css('a')
    end
  end

end
