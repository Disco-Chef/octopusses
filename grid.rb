require_relative 'dumb_octopus'

class Grid
  attr_reader :columns, :rows, :octopi_in_grid

  def initialize(rows, columns)
    @rows = rows
    @columns = columns
    create_dumb_octopi
  end

  def create_dumb_octopi
    require 'pp'
    @octopi_in_grid = Array.new(@rows) { Array.new(@columns) }
    lines = File.read('input.txt').split("\n")
    lines.each_with_index do |row, y|
      row.split('').map!(&:to_i).each_with_index do |number, x|
        dumb_octopus = DumbOctopus.new(y, x, self, number)
        @octopi_in_grid[y][x] = dumb_octopus
        @octopi_in_grid
      end
    end
  end
end
