require "./lib/oystercard"

describe Oystercard do

  it "has a balance of £0 by default" do
    oystercard = Oystercard.new
    expect(oystercard.balance).to eq(0)
  end

end
