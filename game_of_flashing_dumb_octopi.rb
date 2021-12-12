require_relative 'view'

class GameOfFlashingDumbOctopi
  def initialize(grid)
    @grid = grid
    @view = View.new
  end

  def resolve_double_digits
    @grid.octopi_in_grid.each do |row|
      row.each do |octopus|
        if octopus.current_level > 9
          octopus.current_level = 0
          octopus.pump_up_neighbours_of(octopus)
        end
      end
    end
  end

  def count_of_ten
    count_of_ten_plus_digits = 0
    @grid.octopi_in_grid.each do |row|
      row.each do |octopus|
        if octopus.current_level >= 10
          count_of_ten_plus_digits += 1
        end
      end
    end
    count_of_ten_plus_digits
  end

  def count_of_flashes
    flashes = 0
    @grid.octopi_in_grid.each do |row|
      row.each do |octopus|
        flashes += 1 if octopus.current_level.zero?
      end
    end
    flashes
  end

  def run
    flashes = 0
    @view.clear_frame
    (1..1000).each do |n|
      sleep(0.7)
      @grid.octopi_in_grid.each { |row| row.each(&:one_frame!) }
      @view.clear_frame
      resolve_double_digits until count_of_ten.zero?
      flashes += count_of_flashes
      puts "Frame ##{n}"
      puts "Flashes this frame: ##{count_of_flashes}"
      puts "Flashes so far: ##{flashes}"
      @view.draw_frame(@grid)
      @view.how_to_stop_message
      break if count_of_flashes == 100
    end
  end
end
