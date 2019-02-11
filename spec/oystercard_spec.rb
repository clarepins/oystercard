require "./lib/oystercard"

describe Oystercard do

  it "can carry a balance and a new card has £0 by default" do
    oystercard = Oystercard.new
    expect(oystercard.balance).to eq(0)
  end

end
