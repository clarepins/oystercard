class JourneyLog
  attr_reader :journey
  def initialize(journey_class = Journey)
    @journeys = []
    @journey_class = journey_class
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
    @journey ||= @journey_class.new(@start)
  end

end
