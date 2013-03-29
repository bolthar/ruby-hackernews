module RubyHackernews

  class TimeInfo

    SECOND = 1
    MINUTE = 60 * SECOND
    HOUR   = 60 * MINUTE
    DAY    = 24 * HOUR

    def time
      return Time.now - @unit_of_measure * @value
    end

    def initialize(value, unit_of_measure)
      @value           = value
      if(unit_of_measure)
        descriptor = unit_of_measure
        descriptor = unit_of_measure[0..-2] if unit_of_measure[-1].chr == 's'
        @unit_of_measure = self.class.const_get(descriptor.upcase)
      end
    end


  end
 
end  
