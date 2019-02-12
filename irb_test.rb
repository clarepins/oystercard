require "./lib/oystercard.rb"

oystercard = Oystercard.new(5)
oystercard.touch_in("elephant")
oystercard.touch_out("aldgate")
oystercard.journey_history

# expect error balance below minimum fare

# expect to eq zero
