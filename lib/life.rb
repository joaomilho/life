lib = File.expand_path('../', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

require 'set'
require 'life/monkey_patches'

module Life
  autoload :Board,    'life/board'
  autoload :Game,     'life/game'
  autoload :Grid,     'life/grid'
  autoload :Patterns, 'life/patterns'
end
