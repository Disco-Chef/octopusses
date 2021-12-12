class DumbOctopus
  attr_reader :y_position, :x_position
  attr_accessor :current_level

  def initialize(y_position, x_position, grid, current_level)
    @current_level = current_level

    @x_position = x_position
    @y_position = y_position
    @grid = grid
  end

  def neighbouring_octopi
    neighbours = []
    [-1, 0, 1].each do |y_diff|
      next if invalid_y_position?(@y_position + y_diff)

      [-1, 0, 1].each do |x_diff|
        next if invalid_x_position?(@x_position + x_diff) ||
                neighbour_is_self?(@y_position + y_diff, @x_position + x_diff)

        neighbour_octopus = @grid.octopi_in_grid[@y_position + y_diff][@x_position + x_diff]
        neighbours << neighbour_octopus
      end
    end
    neighbours
  end

  def invalid_y_position?(neighbour_y)
    neighbour_y.negative? || neighbour_y >= @grid.rows
  end

  def invalid_x_position?(neighbour_x)
    neighbour_x.negative? || neighbour_x >= @grid.columns
  end

  def neighbour_is_self?(neighbour_y, neighbour_x)
    @grid.octopi_in_grid[neighbour_y][neighbour_x] == self
  end

  def pump_up_neighbours_of(octopus)
    neighbours = octopus.neighbouring_octopi
    neighbours.each do |neighbour|
      neighbour.current_level += 1 unless neighbour.current_level.zero?
    end
  end

  def one_frame!
    @current_level += 1
  end
end
