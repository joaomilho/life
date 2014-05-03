class Life::Grid::StringPresenter
  
  @@live = "@"
  @@dead = " "

  attr_reader :grid

  def initialize grid
    @grid = grid
  end

  def to_s
    @grid.living_cells.each do |cell|
      dead_grid[cell.first][cell.last] = @@live
    end
    dead_grid.map(&:join).join("\n")
  end
  
  private

  def dead_grid
    @dead_grid ||= Array.new(max_rows+1){ Array.new(max_cols+1, @@dead) }
  end
  
  def max_cols
    grid.living_cells.map(&:last).max or 0 
  end

  def max_rows
    grid.living_cells.map(&:first).max or -1
  end

end
