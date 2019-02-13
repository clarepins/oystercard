class Journey
  attr_reader :entry
  attr_reader :exit

  MIN_FARE = 1
  PENALTY_FARE = 6

  def initialize(entry = nil, exit = nil)
    @entry = entry
    @exit = exit
  end

  def in_journey?
    @entry? true : false
  end

  def finish(station = nil)
    @exit = station
    journey = {entry: @entry, exit: @exit}
    @entry = nil
    journey
  end

  def fare
    @exit? MIN_FARE : PENALTY_FARE
  end

end
