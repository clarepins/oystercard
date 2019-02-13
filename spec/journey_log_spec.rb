require "journey_log"

describe JourneyLog do
  before :each do
    @log = JourneyLog.new
  end

  let(:station) { double :station }

  it "Should start a journey" do
    @log.start(station)
  end

  it "should finish a journey" do
    @log.finish(station)
  end

  it "returns a list of all journeys completed" do
    @log.start(station)
    @log.finish(station)
    expect(@log.journeys).to eq([{entry: station, exit: station}])
  end
end
