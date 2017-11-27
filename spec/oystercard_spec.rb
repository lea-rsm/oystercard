require 'Oystercard'

describe Oystercard do

  context 'balance' do
    it 'should initialize with 0 pounds' do
      expect(subject.balance).to eq 0
    end
  end
end
