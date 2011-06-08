
class TimeInfoParser

  def initialize(time_element)
    @element = time_element
  end

  def parse
    if @element
      value           = @element.text.strip.split[0].to_i
      unit_of_measure = @element.text.strip.split[1]
    end
    return TimeInfo.new(value, unit_of_measure)
  end
end


