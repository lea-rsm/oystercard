require 'Oystercard'

describe Oystercard do
  subject(:oystercard) { described_class.new}

  context 'balance' do

    it 'should initialize with 0 pounds' do
      expect(subject.balance).to eq 0
    end
    it 'top up money when desired' do
      expect {oystercard.top_up(10)}.to change{oystercard.balance}.by(10)
    end
    it 'raise error if more than 90 quid' do
      oystercard.top_up(Oystercard::MAX)
      expect{ oystercard.top_up(1) }.to raise_error "You're too wealthy, not more #{Oystercard::MAX}"
    end
    it 'raise error if less than 1 pound' do
      expect{ oystercard.touch_in }.to raise_error "You don't have enough money"
    end
    it 'deduct money from the card' do
      oystercard.top_up(Oystercard::MIN)
      expect{oystercard.deduct(10)}.to change{oystercard.balance}.by(-10)
    end

    it 'reduces set amount of money when asked' do
      card = Oystercard.new
      card.balance = 50
      expect(card.deduct(5)).to eq 45
    end
  end

  context 'card.in_journey?' do

    it {is_expected.to respond_to :in_journey?}
  end

  context 'after touch_in' do

    it 'the card should be in journey ' do
      oystercard.top_up(Oystercard::MIN)
      oystercard.touch_in
      expect(oystercard).to be_in_journey
    end
  end

  context 'after touch_out' do

    it 'the card should not be in journey' do
      oystercard.touch_out
      expect(oystercard).not_to be_in_journey
    end

    it 'deduct money from card' do
      oystercard.top_up(Oystercard::MIN)
      expect{oystercard.touch_out}.to change{oystercard.balance}.by(-Oystercard::MIN_CHARGE)
    end
  end

end
