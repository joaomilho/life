require_relative '../lib/life'

describe Life::Grid do

  describe "#to_s" do
    subject(:grid) do
      Life::Grid.new
    end

    it "it should be empty" do
      expect(grid.to_s).to eq ""   
    end
  end
  
  context "give a grid with a blinker" do
    subject :grid do
      Life::Grid.new *Life::Patterns.blinker 
    end

    let(:blinker_string) do
      ["    ", " @@@"].join("\n")
    end

    it "should have a horizontal blinker" do
      expect(grid.to_s).to eq blinker_string 
    end

    describe "#tick" do
      before do
        grid.tick
      end
      
      let(:vertical_blinker_string) do
        ["  @", "  @", "  @"].join("\n")
      end

      it "should have a vertical blinker" do
        expect(grid.to_s).to eq vertical_blinker_string 
      end 
    end
  end

  context "give a grid with a square" do
    subject :grid do
      Life::Grid.new *Life::Patterns.square 
    end

    let(:square_string) do
      ["@@", "@@"].join("\n")
    end

    it "should have a square" do
      expect(grid.to_s).to eq square_string 
    end

    describe "#tick" do
      before do
        grid.tick
      end
      
      it "should still have a square" do
        expect(grid.to_s).to eq square_string 
      end 
    end
  end

end
