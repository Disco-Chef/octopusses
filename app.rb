require_relative 'grid'
require_relative 'game_of_flashing_dumb_octopi'

grid = Grid.new(10, 10)

game = GameOfFlashingDumbOctopi.new(grid)

game.run
