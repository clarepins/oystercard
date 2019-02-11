require "./lib/oystercard.rb"

oystercard = Oystercard.new

oystercard.top_up(10)
oystercard.balance

# expect to eq zero
