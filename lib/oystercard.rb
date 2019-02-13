class Oystercard

  attr_reader :balance, :journey_history

  BALANCE_LIMIT = 90
  MIN_FARE = 1
  DEFAULT_BALANCE = 0
  MIN_BALANCE = 0

  def initialize(balance = DEFAULT_BALANCE)
    @balance = balance
    @journey_history = []
  end

  def top_up(value)
    fail "You cannot top up above max limit of £#{BALANCE_LIMIT}" if @balance + value > BALANCE_LIMIT
    @balance += value
  end

  def touch_in(station)
    raise "Balance below minimum fare" if @balance < MIN_FARE
    @journey = Journey.new(station)
  end

  def touch_out(station)
    @journey = Journey.new if @journey.nil?
    @journey_history << @journey.finish(station)
    deduct
  end

private
  def deduct
    @balance -= @journey.fare
  end

end
