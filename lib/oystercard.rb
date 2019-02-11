class Oystercard

  attr_reader :balance
  attr_reader :in_use

  BALANCE_LIMIT = 90
  MIN_FARE = 1
  DEFAULT_BALANCE = 0
  MIN_BALANCE = 0


  def initialize(balance = DEFAULT_BALANCE)
    @balance = balance
  end

  def top_up(value)
    fail "You cannot top up above max limit of £90" if @balance + value > BALANCE_LIMIT
    @balance += value
  end

  def in_journey?
    @in_use
  end

  def touch_in
    raise "Balance below minimum fare" if @balance < MIN_FARE
    @in_use = true
  end

  def touch_out
    deduct
    @in_use = false
  end

private
  def deduct(value = MIN_FARE)
    fail "You cannot deduct below zero" if @balance - value < MIN_BALANCE
    @balance -= value
  end
end
