class Journey
  attr_reader :entry
  attr_reader :exit

  def initialize(entry = nil, exit = nil)
    @entry = entry
    @exit = exit
  end

  def in_journey?
    return true if @entry
    false
  end

  def finish(station)
    journey = {entry: @entry, exit: station}
    @entry = nil
    journey
  end

end
