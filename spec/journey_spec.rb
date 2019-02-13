require "./lib/journey.rb"

describe Journey do
  before :each do
    @journey = Journey.new("Elephant")
  end

  it "is 'in journey' when a journey has begun but not finished" do
    expect(@journey.in_journey?).to eq(true)
  end

  it "is not longer in journey once journey is finsihed" do
    @journey.finish("Aldgate")
    expect(@journey.in_journey?).to eq(false)
  end

  it "Returns the entry and exit station in a hash" do
    expect(@journey.finish("Aldgate")).to eq({entry: "Elephant", exit: "Aldgate"})
  end

  it "returns the fare when the journey is finished" do
    @journey.finish("Aldgate")
    expect(@journey.fare).to eq(Journey::MIN_FARE)
  end

  it "Has a constant for minimum fare that equals 1" do
    expect(Journey::MIN_FARE).to eq 1
  end

  it "Applies penalty fare if there is not exit station" do
    @journey.finish
    expect(@journey.fare).to eq Journey::PENALTY_FARE
  end

  it "Has a penalty fare constant that equals 6" do
    expect(Journey::PENALTY_FARE).to eq 6 
  end
end
