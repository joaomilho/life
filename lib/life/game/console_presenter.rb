module Life::Game::ConsolePresenter
  def self.display(grid)
    print "\e[2J\e[f"
    puts grid.to_s
  end
end
