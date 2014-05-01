require_relative '../lib/life'

describe Fixnum do
  describe '#around' do
    it 'should return array from previous to next number' do
      expect(7.around).to eq([6, 7, 8])
    end
  end
end
