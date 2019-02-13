class Journey
  attr_reader :entry_station
  attr_reader :exit_station

  def initialize(entry_station = nil, exit_station = nil)
    @entry_station = entry_station
    @exit_station = exit_station
  end

  def in_journey?
    return true if @entry_station
    false
  end

  def finish(station)
    @entry_station = nil
  end

end
