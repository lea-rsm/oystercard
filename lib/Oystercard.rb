class Oystercard

  attr_accessor :balance, :entry_station, :journeys
  # attr_accessor :in_journey
  MAX = 90
  MIN = 1
  MIN_CHARGE = 1

   def initialize
     @balance = 0
     @in_journey = false
     @entry_station = nil
     @journeys = []
   end

   def top_up(chosen_value)
     raise "You're too wealthy, not more #{Oystercard::MAX}" if @balance + chosen_value > MAX
     @balance += chosen_value

   end



   def touch_in(entry)
      raise "You don't have enough money" if @balance < MIN
      @entry_station = entry
   end

   def in_journey?
     !!@entry_station
   end

   def touch_out(station)
     @journeys << {@entry_station => station}
     @entry_station = nil
     deduct(MIN_CHARGE)
   end
  private

   def deduct(value)
     @balance -= value
   end


end
