require 'journey'
require 'Oystercard'
require 'station'

describe Journey do
  # let(:oystercard) {double(:oystercard, balance: 60, journeys: [], history: [])}
  let(:oystercard) {Oystercard.new}
  let(:station) { double(:station) }
  let(:station2) { double(:station2) }

  it "initializes with entry station as no station as default" do
    new_journey = Journey.new
    expect(new_journey.entry_station).to eq nil
  end

  it 'initializes with exit station as no station as default' do
    new_journey = Journey.new
    expect(new_journey.exit_station).to eq nil
  end

  it "starts a journey" do
    new_journey = Journey.new("Euston", "Haggerston")
    expect(new_journey.entry_station).to eq "Euston"
  end

  it "finishes a journey" do
    new_journey = Journey.new("Euston", "Haggerston")
    expect(new_journey.finish("Haggerston")).to eq "Haggerston"
  end

  it "Calculates the fare for a journey" do
    new_journey = Journey.new("Euston", "Haggerston")
    expect(new_journey.fare).to eq Journey::MIN_JOURNEY_FARE
  end

  it "Tests if journey is complete" do
    new_journey = Journey.new("Euston", "Haggerston")
    expect(new_journey).to be_complete
  end

  it 'Tests if journey is incomplete if only has entry station' do
    new_journey = Journey.new(nil, "Haggerston")
    expect(new_journey).not_to be_complete
  end

  it 'Tests if journey is incomplete if only has exit station' do
    new_journey = Journey.new("Euston", nil)
    expect(new_journey).not_to be_complete
  end
  it 'charges penalty when journey is not complete' do
    new_journey = Journey.new("Euston", nil)
    oystercard.top_up(50)
    oystercard.touch_in(station)
    expect(new_journey.fare).to eq(Journey::PENALTY)

  end

end
