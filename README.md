Conway's Game of Life
===

Game of Life is a cellular automaton zero-player game. If you don't know what is all about, read this first:

[en.wikipedia.org/wiki/Conway's_Game_of_Life](http://en.wikipedia.org/wiki/Conway's_Game_of_Life)


Sample code
===

```ruby
class Life::Grid
  autoload :StringPresenter, 'life/grid/string_presenter'  

  attr_reader :rows, :cols, :living_cells

  def initialize *living_cells
    @living_cells = living_cells.to_set
  end

  def is_cell_alive?(row, col)
    living_cells.include?([row, col])
  end

  def to_s
    StringPresenter.new(self).to_s
  end

  def next
    @living_cells = living_cells.inject(Set.new) do |new_living_cells, living_cell|
      new_living_cells << living_cell if keep_living?(living_cell) 
      new_living_cells += born_neighbours(living_cell) 
    end
  end
  
  alias :tick :next
  
  private

  def born_neighbours(cell)
    dead_neighbours(cell).select do |dead_cell|
      born?(dead_cell) 
    end
  end

  def born?(cell)
    living_neighbours(cell).size == 3
  end

  def keep_living?(cell)
    living_neighbours(cell).size.between?(2, 3)
  end

  def living_neighbours cell
    cell.neighbours & living_cells
  end

  def dead_neighbours cell
    cell.neighbours - living_cells 
  end
  
end
```

Running a game
===

To run a game, include the library and execute:

```ruby
Life::Game.new :pattern
```

Where pattern is a pattern available in the pattern library. Try ```:gosper_gun``` to maximize fun.


My design decisions
===

- Separate logic from presentation. I've only implemented a ConsolePresenter for the game, that uses a StringPresenter for the grid, but you can easily implement image, sound, 3d, or whatever-comes-to-your-mind presenter.
- Do not use a fixed grid. What I do is to iterate over the living cells, and then over the dead cells around 'em to check if they should be born. This decision made me decide not to create a Cell object to handle indivual cell logic (like cell.live?) because it would make it more complex instead of simple (kind of counterintuitive but trust me on this).
- There's a simples list of patterns on a module called Patterns. Extending this would be great.

