

class Oystercard

  attr_accessor :balance
  attr_accessor :in_journey
  MAX = 90

   def initialize
     @balance = 0
     @in_journey = false
   end

   def top_up(chosen_value)
     raise "You're too wealthy, not more #{Oystercard::MAX}" if @balance + chosen_value >= MAX
     @balance + chosen_value
   end

   def deduct(value)
     @balance - value
   end

   def touch_in
      @in_journey = true

   end

   def touch_out
     @in_journey = false
   end

   def in_journey?
     @in_journey
   end

end
