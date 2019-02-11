class Oystercard

  attr_reader :balance

  BALANCE_LIMIT = 90

  def initialize(balance = 0)
    @balance = balance
  end

  def top_up(value)
    fail "You cannot top up above max limit of £90" if value + @balance > BALANCE_LIMIT
    @balance += value
  end

end
