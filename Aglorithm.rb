# Placement Criteria: Begin with implementing the algorithm.
# First define what our successful criteria:
# 1. rowSafe checks the uniqueness of the values in the row
# 2. colSafe checks it in the column
# 3. boxSafe in the 3x3 grid
# Then evaluate whether the coordinates of the emptyCell (Ruby hash containing both coordinates)



class Puzzle
    def self.rowsafe(puzzleArray, emptyCell, num)
      # puzzleArray is the game board being solved. A 9x9 matrix
      # emptyCell = {rowIndex: INT , colIndex: INT } INT = coordinates of currently empty cell
      # num = integer value 1-9 being tested

        return puzzleArray[emptyCell.rowIndex].index(num).nil?
        end
    end

    def self.colsafe(puzzleArray, emptyCell, num)
        # puzzleArray is the game board being solved. A 9x9 matrix
        # emptyCell = {rowIndex: INT , colIndex: INT } INT = coordinates of currently empty cell
        # num = integer value 1-9 being tested

        return !puzzleArray.some(row => row[ emptyCell.colIndex ] == num)
    end
  
    def boxSafe(puzzleArray, emptyCell, num)
        # puzzleArray is the game board being solved. A 9x9 matrix
        # emptyCell = {rowIndex: INT , colIndex: INT } INT = coordinates of currently empty cell
        # num = integer value 1-9 being tested
        # Define top left corner of box region for empty cell
    
        boxStartRow = emptyCell.rowIndex - (emptyCell.rowIndex % 3) 
        boxStartCol = emptyCell.colIndex - (emptyCell.colIndex % 3)
        
        safe = true
    
        [0, 1, 2].each do |boxRow|  # Each box region has 3 rows
        [0, 1, 2].each do |boxCol|  # Each box region has 3 columns
        # Is num is present in box region?
    
        if puzzleArray[boxStartRow + boxRow][boxStartCol + boxCol] == num  
            safe = false # If number is found, it is not safe to place
            end
        end
    end
    
        return safe
        end
    
    def safe_to_place(puzzleArray, empthyCell, num)

        return rowSafe(puzzleArray, emptyCell, num) && 
        
        colSafe(puzzleArray, emptyCell, num) && 
        boxSafe(puzzleArray, emptyCell, num) 
    end


