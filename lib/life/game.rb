module Life
  class Game
    autoload :ConsolePresenter, 'life/game/console_presenter'

    attr_reader :grid, :presenter

    def initialize(pattern_or_coordinates, presenter=ConsolePresenter)
      coordinates = pattern_or_coordinates.is_a?(Symbol) ?
        Patterns.send(pattern_or_coordinates) :
        pattern_or_coordinates
   
      @grid = Grid.new(*coordinates)
      @presenter = presenter
    end
    
    def play
      while continue?
        presenter.display(grid)
        grid.tick
        sleep 0.2
      end
    end
    
    private

    def continue?
      true
    end
  end
end
