require "./lib/oystercard.rb"
require "./lib/journey.rb"
require "./lib/station.rb"
require "./lib/journey_log.rb"

card = Oystercard.new
card.top_up(20)
elephant = Station.new("Elephant", 2)
aldgate = Station.new("Aldgate", 1)
card.touch_in(elephant)
card.touch_out(aldgate)
card.balance

card_2 = Oystercard.new
card_2.top_up(20)
card_2.touch_in
card_2.touch_out(aldgate)

card_3 = Oystercard.new
card_3.top_up(20)
card_3.touch_in(elephant)
card_3.touch_out
card_3.balance

journey_log =
