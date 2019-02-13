require "./lib/oystercard.rb"
require "./lib/journey.rb"

# oystercard = Oystercard.new(5)
# oystercard.touch_in("elephant")
# oystercard.touch_out("aldgate")
# oystercard.journey_history
#
# require "./lib/station.rb"
# Station.new("station", :zone)

journey = Journey.new("Elephant")

journey.in_journey?

journey.finish("Aldgate")

journey.fare
