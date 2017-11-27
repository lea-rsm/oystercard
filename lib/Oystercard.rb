
class Oystercard

  attr_accessor :balance
  MAX = 90

   def initialize
     @balance = 0

   end

   def top_up(chosen_value)
     raise "You're too wealthy, not more #{Oystercard::MAX}" if @balance + chosen_value >= MAX
     @balance + chosen_value
   end
end
