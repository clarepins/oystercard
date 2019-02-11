require "./lib/oystercard.rb"

oystercard = Oystercard.new

oystercard.top_up(100)
# expect error above max value

# expect to eq zero
