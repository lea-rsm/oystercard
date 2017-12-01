require_relative 'station'
require_relative 'journey'

class Oystercard

  attr_accessor :balance, :entry_station, :journeys, :history
  # attr_accessor :in_journey
  MAX = 90
  MIN = 1
  MIN_CHARGE = 1

   def initialize
     @balance = 0.to_f
     @in_journey = false
     @history = []
     @journeys = []
     @journey = Journey.new
   end

   def top_up(chosen_value)
     raise "You're too wealthy, not more #{Oystercard::MAX}" if @balance + chosen_value > MAX
     @balance += chosen_value

   end



   def touch_in(entry)
       raise "You don't have enough money" if @balance < MIN
     if !@entry_station.nil?
       deduct(@journey.fare)
     end

      # @journey.start(entry)
      @entry_station = entry
      @in_journey = true
      @entry_station
      # @history << :entry
   end



   def touch_out(station)
     # @journey.finish(station)
     @exit_station = station
     @journeys << {entry_station: @entry_station, exit_station: @exit_station}
     # @history << :exit
     # @entry_station = nil
     @in_journey = false
     deduct(@journey.fare)
   end

   def in_journey?
     !!@in_journey
   end

  private

   def deduct(value)
     @balance -= value
   end


end
