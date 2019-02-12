require "./lib/oystercard.rb"

oystercard = Oystercard.new(5)
oystercard.touch_in
oystercard.travelled_from("Elephant")

# expect error balance below minimum fare

# expect to eq zero
