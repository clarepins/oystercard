class Oystercard

  attr_reader :balance, :journey_history

  BALANCE_LIMIT = 90
  MIN_FARE = 1
  DEFAULT_BALANCE = 0
  MIN_BALANCE = 0

  def initialize(balance = DEFAULT_BALANCE)
    @balance = balance
    @journey_history = JourneyLog.new
  end

  def top_up(value)
    fail "You cannot top up above max limit of £#{BALANCE_LIMIT}" if @balance + value > BALANCE_LIMIT
    @balance += value
  end

  def touch_in(station = nil)
    raise "Balance below minimum fare" if @balance < MIN_FARE
    @journey_history.start(station)
  end

  def touch_out(station = nil)
    @journey_history.finish(station)
    deduct
  end

private
  def deduct
    @balance -= @journey_history.journey.fare
  end

end
