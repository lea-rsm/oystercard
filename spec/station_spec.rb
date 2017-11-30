require 'station'

describe Station do
  subject(:station) {described_class.new("Haggerston", 2)}

  it "should initialize with name" do
    expect(station.name).to eq "Haggerston"
  end

  it "should initialize with zone" do
    expect(station.zone).to eq(2)
  end

end
