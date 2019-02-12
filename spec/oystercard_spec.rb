require "./lib/oystercard"

describe Oystercard do
  before(:each) do
    @oystercard = Oystercard.new
    @oystercard_5 = Oystercard.new(5)
  end

  let(:station) { double :station }

  it "has a balance of £DEFAULT_BALANCE by default" do
    expect(@oystercard.balance).to eq(Oystercard::DEFAULT_BALANCE)
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

  it "deducts value from the card when touch_out method is passed" do
    oystercard = Oystercard.new(70)
    oystercard.touch_out(station)
    expect(oystercard.balance).to eq(70 - Oystercard::MIN_FARE)
  end

  # it "throws an error when asked to deduct below zero" do
  #   message = "You cannot deduct below zero"
  #   expect { @oystercard.touch_out }.to raise_error(message)
  # end

  it { is_expected.to respond_to(:in_journey?)}

  it { is_expected.to respond_to(:touch_in)}

  it { is_expected.to respond_to(:touch_out)}

  it "is 'in_journey' if the card has touched in but not touched out" do
    oystercard = Oystercard.new(10)
    oystercard.touch_in(station)
    expect(oystercard.in_journey?).to eq(true)
  end

  it "is NOT 'in_journey' if the card has touched out" do
      @oystercard.touch_out(station)
      expect(@oystercard.in_journey?).to eq(nil)
  end

  it "throws an error message when touch_in with balance below minimum fare" do
    oystercard = Oystercard.new(0.5)
    expect { oystercard.touch_in(station) }.to raise_error("Balance below minimum fare")
  end

  it "balance changes by " do
    expect { @oystercard.touch_out(station) }.to change{@oystercard.balance}.by(- Oystercard::MIN_FARE)
  end

  it "saves entry station" do
    @oystercard_5.touch_in(station)
    expect(@oystercard_5.entry_station).to eq(station)
  end

  it "saves exit station" do
    @oystercard_5.touch_out(station)
    expect(@oystercard_5.exit_station).to eq(station)
  end

  it "has an empty list of journeys when card is created" do
    expect(@oystercard.journey_history).to eq([])
  end

  it "saves journey_history" do
    @oystercard_5.touch_in("station A")
    @oystercard_5.touch_out("station B")
    @oystercard_5.touch_in("station C")
    @oystercard_5.touch_out("station D")
    journey_history = [{entry_station: "station A", exit_station: "station B"},
      {entry_station: "station C", exit_station: "station D"}]
    expect(@oystercard_5.journey_history).to eq(journey_history)
  end

end
