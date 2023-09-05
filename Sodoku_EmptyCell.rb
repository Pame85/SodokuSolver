class SodokuCell

  def nextEmptyCell(puzzleArray)
    emptyCell = {rowIndex: "", colIndex: ""}
  end
  
  def puzzleArray
    puzzleArray.forEach(row, rowIndex)
    # If this key has already been assigned, skip iteration
    if (emptyCell.colIndex != "" ) 
      return
    end 

    # find first zero-element
      firstZero = row.find { |col| col === 0 }
    # if no zero present, skip to next row
    if (firstZero.nil?) 
      return
    end 

    emptyCell.rowIndex = rowIndex
    emptyCell.colIndex = row.indexOf(firstZero)
  
  
    if (emptyCell.colIndex != "") 
      return emptyCell 
    end

    # If emptyCell was never assigned, there are no more zeros
    return false
  end
end
