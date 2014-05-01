class Life::Grid::StringPresenter
  
  @@live = "@"
  @@dead = " "

  attr_reader :grid

  def initialize grid
    @grid = grid
  end

  def to_s
    0.upto(max_rows).map do |row|
      0.upto(max_cols).map do |col|
        @grid.is_cell_alive?(row, col) ? @@live : @@dead
      end.join
    end.join("\n")
  end
  
  private

  def max_cols
    grid.living_cells.map(&:last).max
  end

  def max_rows
    grid.living_cells.map(&:first).max or -1
  end

end
