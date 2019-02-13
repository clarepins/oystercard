class JourneyLog

  def initialize
    @journeys = []
  end

  def start(station)
    @start = station
    current_journey
  end

  def finish(station)
    current_journey
    @journeys << @current_journey.finish(station)
  end

  def journeys
    @journeys
  end

private
  def current_journey
    @current_journey ||= Journey.new(@start)
  end

end
