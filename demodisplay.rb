class SudokuSolver

    def initialize(grid)
        @grid = grid
    end

    def display_grid()
        @grid.each_with_index do |row, i|
            puts row.each_slice(3).map { |slice| slice.join(' ') }.join(' | ')
            puts "---------------------" if (i + 1) % 3 == 0 && i <8
        end
    end
end

input_grid = [
  [0, 1, 5, 0, 0, 3, 0, 0, 2],
  [0, 0, 0, 1, 0, 0, 9, 0, 6],
  [2, 7, 0, 0, 6, 8, 4, 3, 0],
  [4, 9, 0, 0, 0, 2, 0, 1, 7],
  [5, 0, 1, 0, 4, 0, 3, 8, 0],
  [0, 0, 3, 9, 0, 5, 0, 0, 0],
  [9, 0, 0, 0, 8, 1, 0, 4, 0],
  [8, 6, 0, 0, 7, 0, 0, 2, 5],
  [0, 3, 7, 2, 0, 4, 6, 0, 0]
]

sudoku = SudokuSolver.new(input_grid)

puts "Sudoku puzzle. (EASY)"
puts
sudoku.display_grid()