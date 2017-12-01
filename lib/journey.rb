require_relative 'Oystercard'

class Journey
  attr_accessor :entry_station, :exit_station, :start, :finish
  MIN_JOURNEY_FARE = 2
  PENALTY = 6

  def initialize(entry_station = nil, exit_station = nil)
    @entry_station = entry_station
    @exit_station = exit_station
  end


  def fare
    complete? ? MIN_JOURNEY_FARE : PENALTY

  end

  def complete?
  (@entry_station != nil && @exit_station != nil) ? true : false
  end

end
