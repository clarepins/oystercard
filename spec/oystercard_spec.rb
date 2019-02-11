require "./lib/oystercard"

describe Oystercard do
  before(:each) do
    @oystercard = Oystercard.new
  end

  it "has a balance of £0 by default" do
    expect(@oystercard.balance).to eq(0)
  end

  it "has a balance of 10 when topped up with £10" do
    @oystercard.top_up(10)
    expect(@oystercard.balance).to eq(10)
  end

  it "thows an error when trying to top up above 90" do
    message = "You cannot top up above max limit of £90"
    expect { @oystercard.top_up(100) }.to raise_error(message)
  end

  it "throws an error when topping up 30 from 70" do
    oystercard = Oystercard.new(70)
    message = "You cannot top up above max limit of £90"
    expect { oystercard.top_up(30) }.to raise_error(message)
  end

  it "deducts value from the card when deduct method is passed" do
    oystercard = Oystercard.new(70)
    oystercard.deduct(10)
    expect(oystercard.balance).to eq(60)
  end

end
