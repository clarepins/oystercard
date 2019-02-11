require "./lib/oystercard.rb"

oystercard = Oystercard.new

oystercard.deduct(20)
oystercard.balance
# expect error undefined method

# expect to eq zero
