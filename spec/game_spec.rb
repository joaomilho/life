require_relative '../lib/life'

describe Life::Game do
  describe "#play" do
    before do 
      allow(Life::Patterns).to receive(:pattern)

      @presenter = double(:presenter)
      allow(@presenter).to receive(:display)

      expect_any_instance_of(Life::Grid).to receive(:tick)

      @game = Life::Game.new(:pattern, @presenter)
      allow(@game).to receive(:continue?).and_return(true, false)
      @game.play
    end

    it "should use the presenter" do
      expect(@presenter).to have_received(:display)
    end

    it "should call grid tick" do
      # if it gets here, it passed :D
    end
  end
end
