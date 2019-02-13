require "./lib/oystercard.rb"
require "./lib/journey.rb"
require "./lib/station.rb"
require "./lib/journey_log.rb"

card = Oystercard.new
card.top_up(20)
elephant = Station.new("Elephant", :zone_2)
aldgate = Station.new("Aldgate", :zone_1)
card.touch_in(elephant)
card.touch_out(aldgate)
card.balance

card_2 = Oystercard.new
card_2.top_up(20)
card_2.touch_in
card_2.touch_out(aldgate)

log = JourneyLog.new
