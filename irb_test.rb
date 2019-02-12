require "./lib/oystercard.rb"

oystercard = Oystercard.new(5)
oystercard.touch_in("elephant")
oystercard.touch_out("aldgate")
oystercard.journey_history

require "./lib/station.rb"
Station.new("station", :zone)
