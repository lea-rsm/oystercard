require './lib/Oystercard.rb'
require './lib/station.rb'
require './lib/journey.rb'

p exit_station = Station.new("Euston", 1)
p entry_station = Station.new("Haggerston", 2)
p card = Oystercard.new
p card.top_up(50)
p card.touch_in(entry_station)
p card.touch_in(exit_station)
p card.balance
