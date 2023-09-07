require 'colorize'

input_string = "015003002000100906270068430490002017501040380003905000900081040860070025037204600"

def parse_string(input)
    grid = []
    input.chars.each_slice(9) do |row|
        grid << row.map do |char|
            char.to_i
        end
    end
    # grid.each do |row|
    #     puts row.join(" ")
    grid
end

grid = parse_string(input_string)
puts "\n1. Given a default value, Solve this Sodoku Puzzle:\n\n".blue
for row in grid
    p row
    
end

puts "\n2. Solution , fill all of the row with num (1..9) while skip non-zero value:\n\n".blue
# iterate through each row in the grid
    grid.each do |row|
    row.each_with_index do |cell, index|
    # Check if the cell is empty (equal to)

        if cell == 0
        # calculate unused numbers for this row
        unused_numbers = (1..9).to_a - row

        # Fill the empty cell with the first unused number
        row[index] = unused_numbers.first
        end
    end
end

# Print the updated grid
grid.each do |row|
    p row 
    end
    puts "\n"