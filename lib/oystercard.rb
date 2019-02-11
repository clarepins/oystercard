class Oystercard

  attr_reader :balance

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
  end

  def touch_in
    in_journey? = true
  end

  def touch_out
    in_journey? = false
  end

end
