require 'Oystercard'

describe Oystercard do

  context 'balance' do

    it 'should initialize with 0 pounds' do
      expect(subject.balance).to eq 0
    end
    it 'top up money when desired' do
      chosen_value = 1000
      expect(subject.top_up(chosen_value)).to eq(1000)
    end

  end
end
