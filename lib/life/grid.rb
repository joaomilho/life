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
