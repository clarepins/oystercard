require "./lib/journey.rb"

describe Journey do

  let(:station) {double :station}
  let(:other_station) {double :other_station}

  before :each do
    @journey = Journey.new(station)
  end

  it "is 'in journey' when a journey has begun but not finished" do
    expect(@journey.in_journey?).to eq(true)
  end

  it "is not longer in journey once journey is finsihed" do
    @journey.finish(other_station)
    expect(@journey.in_journey?).to eq(false)
  end

  it "Returns the entry and exit station in a hash" do
    expect(@journey.finish(other_station)).to eq({entry: station, exit: other_station})
  end

  it "Has a constant for minimum fare that equals 1" do
    expect(Journey::MIN_FARE).to eq 1
  end

  it "Applies penalty fare if there is no exit station" do
    @journey.finish
    expect(@journey.fare).to eq Journey::PENALTY_FARE
  end

  it "Has a penalty fare constant that equals 6" do
    expect(Journey::PENALTY_FARE).to eq 6
  end

  it "Applies penalty fare if there is no entry station" do
    journey = Journey.new
    journey.finish(other_station)
    expect(journey.fare).to eq Journey::PENALTY_FARE
  end

  it "Saves the entry station during the journey" do
    expect(@journey.entry).to eq station
  end

  it "Has a fare of one when travelling from zone 1 to zone 1" do
    update_zone(1,1)
    expect(@journey.fare).to eq 1
  end

  it "Has a fare of 3 when travelling from zone 2 to zone 4" do
    update_zone(2,4)
    expect(@journey.fare).to eq 3
  end

  def update_zone(entry_zone, exit_zone)
    @journey.finish(other_station)
    allow(station).to receive(:zone).and_return(entry_zone)
    allow(other_station).to receive(:zone).and_return(exit_zone)
  end
end
