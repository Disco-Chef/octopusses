require 'colorize'
class View
  def draw_frame(grid)
    limit = grid.columns
    counter = 1
    grid.octopi_in_grid.each do |row|
      row.each do |cell|
        counter % limit != 0 ? print(visual_cell(cell)) : puts(visual_cell(cell))
        counter += 1
      end
    end
  end

  def clear_frame
    print(`clear`)
  end

  def visual_cell(cell)
    case cell.current_level
    when 0 then " #{cell.current_level}".colorize(:red)
    when 9 then " #{cell.current_level}".colorize(:orange)
    when 8 then " #{cell.current_level}".colorize(:yellow)
    when 7 then " #{cell.current_level}"
    when 6 then " #{cell.current_level}"
    when 5 then " #{cell.current_level}"
    when 4 then " #{cell.current_level}"
    when 3 then " #{cell.current_level}"
    when 2 then " #{cell.current_level}"
    when 1 then " #{cell.current_level}"
    end

  end

  def how_to_stop_message
    puts 'To stop running the game, press Ctrl + C'
  end
end
