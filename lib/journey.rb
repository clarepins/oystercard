class Journey
  attr_reader :entry, :exit

  MIN_FARE = 1
  PENALTY_FARE = 6
  ZONE_FARE = 1

  def initialize(entry = nil, exit = nil)
    @entry = entry
    @exit = exit
    @in_journey = true
  end

  def in_journey?
    @in_journey
  end

  def finish(station = nil)
    @exit = station
    @in_journey = false
    journey = {entry: @entry, exit: @exit}
    journey
  end

  def fare
    @exit && @entry ? MIN_FARE + (@entry.zone - @exit.zone).abs * ZONE_FARE : PENALTY_FARE
  end

end
