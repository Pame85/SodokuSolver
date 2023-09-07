require 'colorize'

input_string = "015003002000100906270068430490002017501040380003905000900081040860070025037204600"

def parse_string(input)
  grid = []
  input.chars.each_slice(9) do |row|
    grid << row.map do |char|
      char.to_i
    end
  end
  grid
end

def print_grid(grid)
  grid.each do |row|
    colored_row = row.map do |num|
      if num == 0
        num.to_s.colorize(:red)
      else
        num.to_s
      end
    end
    puts colored_row.join(" ")
  end
end

def find_empty_cell(grid)
  grid.each_with_index do |row, row_index|
    row.each_with_index do |col, col_index|
      if col == 0
        return { row_index: row_index, col_index: col_index }
      end
    end
  end
  nil
end

def is_valid_move?(grid, row, col, num)
  # Check if 'num' is present in the same row or column
  for i in 0..8
    return false if grid[row][i] == num || grid[i][col] == num
  end

  # Check if 'num' is present in the 3x3 grid
  start_row, start_col = 3 * (row / 3), 3 * (col / 3)
  for r in start_row...(start_row + 3)
    for c in start_col...(start_col + 3)
      return false if grid[r][c] == num
    end
  end

  true
end

def solve_sudoku(grid)
  empty_cell = find_empty_cell(grid)
  return true if empty_cell.nil? # No empty cell means the puzzle is solved

  row, col = empty_cell[:row_index], empty_cell[:col_index]

  for num in 1..9
    if is_valid_move?(grid, row, col, num)
      grid[row][col] = num

      if solve_sudoku(grid)
        return true
      end

      grid[row][col] = 0 # If the current move doesn't lead to a solution, backtrack
    end
  end

  false
end

grid = parse_string(input_string)
puts "\n1. Given a default value, Solve this Sudoku Puzzle:\n\n".blue
print_grid(grid)

if solve_sudoku(grid)
  puts "\n2. Solution, fill all of the row & col with num (1..9) while skipping non-zero values:\n\n".green
  print_grid(grid)
  puts "\n"
else
  puts "No solution found for this Sudoku puzzle."
end
