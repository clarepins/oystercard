class JourneyLog
  attr_reader :journey
  def initialize
    @journeys = []
  end

  def start(station)
    @journey = nil
    @start = station
    current_journey
  end

  def finish(station)
    current_journey
    @journeys << @journey.finish(station)
  end

  def journeys
    @journeys
  end

private
  def current_journey
    @journey ||= Journey.new(@start)
  end

end
