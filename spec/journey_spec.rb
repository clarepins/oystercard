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

  

end
