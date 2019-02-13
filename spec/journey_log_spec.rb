require "journey_log"

describe JourneyLog do
  before :each do
    log = JourneyLog.new
  end

  let(:station) { double :station }

  it "Should start a journey" do
    log.start(station)
  end
end
