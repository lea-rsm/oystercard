require 'Oystercard'

describe Oystercard do

  context 'balance' do

    it 'should initialize with 0 pounds' do
      expect(subject.balance).to eq 0
    end
    it 'top up money when desired' do
      chosen_value = 20
      expect(subject.top_up(chosen_value)).to eq(20)
    end
    it 'raise error if more than 90 quid' do
      card = Oystercard.new
      card.balance = 89
      expect{ card.top_up(2) }.to raise_error "You're too wealthy, not more #{Oystercard::MAX}"
    end

    it 'reduces set amount of money when asked' do
      card = Oystercard.new
      card.balance = 50
      expect(card.deduct(5)).to eq 45
    end
  end
end
