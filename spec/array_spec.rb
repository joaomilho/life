require_relative '../lib/life'

describe Array do
  describe '#neighbours' do
    let(:neighbours) do
      Set.new [
        [0, 0],
        [0, 1],
        [0, 2],
        [1, 0],
        [1, 2],
        [2, 0],
        [2, 1],
        [2, 2]
      ]
    end
    
    it 'should return all cells around as a set' do
      expect([1, 1].neighbours).to eq(neighbours)
    end
  end
end
