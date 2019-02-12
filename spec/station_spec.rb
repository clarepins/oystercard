require "./lib/station.rb"

describe Station do

  it "saves station name" do
    station = Station.new("elephant", :zone_1)
    expect(station.name).to eq("elephant")
  end

  it "saves station zone" do
    station = Station.new("elephant", :zone_1)
    expect(station.zone).to eq(:zone_1)
  end

end
