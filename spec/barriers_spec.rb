require "Barriers"
require "Oystercard"

describe Barriers do

  context 'card.in_journey?' do
    it {is_expected.to respond_to :in_journey?}
  end

  context 'after touch_in' do
    it 'should be true ' do
      card = Oystercard.new
      expect(subject.touch_in(card)).to eq (card.in_journey = true)
    end
  
  end

  context 'after touch_out' do
    it 'should be false' do
      card = Oystercard.new
      expect(subject.touch_out(card)).to eq (card.in_journey = false)
    end
  end
end
