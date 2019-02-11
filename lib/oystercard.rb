class Oystercard

  attr_reader :balance
  attr_reader :in_use

  BALANCE_LIMIT = 90

  def initialize(balance = 0)
    @balance = balance
  end

  def top_up(value)
    fail "You cannot top up above max limit of £90" if @balance + value > BALANCE_LIMIT
    @balance += value
  end

  def deduct(value)
    fail "You cannot deduct below zero" if @balance - value < 0
    @balance -= value
  end

  def in_journey?
    @in_use
  end

  def touch_in
    @in_use = true
  end

  def touch_out
    @in_use = false
  end

end
