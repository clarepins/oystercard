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

  it "trows an error when asked to deduct below zero" do
    message = "You cannot deduct below zero"
    expect { @oystercard.deduct(10) }.to raise_error(message)
  end

  it { is_expected.to respond_to(:in_journey?)}

  it { is_expected.to respond_to(:touch_in)}

  it { is_expected.to respond_to(:touch_out)}

  it "is 'in_journey' if the card has touched in but not touched out" do
    @oystercard.touch_in
    expect(@oystercard.in_journey?).to eq(true)
  end

  it "is NOT 'in_journey' if the card has touched out" do
      @oystercard.touch_out
      expect(@oystercard.in_journey?).to eq(false)
  end

end
