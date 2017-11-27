
class Oystercard

  attr_accessor :balance
  MAX = 90

   def initialize
     @balance = 0

   end

   def top_up(chosen_value)
     raise "You're too wealthy" if @balance + chosen_value >= MAX
     @balance = @balance + chosen_value
   end
end
