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
puts "\nSolve this Sodoku Puzzle:\n"
for row in grid
    p row
    
end

# puts "\nfirst row : #{grid.first()}\n\n" 
# # output print => the first row [0, 1, 5, 0, 0, 3, 0, 0, 2]

# first_element = grid[0][0]
# puts "first element : #{first_element}"

# # Fill the first row with numbers from 1 to 9
# grid[0] = (1..9).to_a   #.to_a shows here called on this range
# # Print the updated grid
# puts "\nThe updated filled (1..9)first row:\n\n"
# grid.each do |row|
#     p row
# end

puts "\nFill the 1st row with num (1..9) while skip non-zero value:\n\n"
# The 'cell' here are block variables for Ruby block.
# It's represents the current element or item in the array.
# The .to_a shows here called on this range
grid[0].each_with_index do |cell,index|
    if cell == 0
    unused_numbers = (1..9).to_a - grid[0]
    grid[0][index] = unused_numbers.first
    end
end

# Print the updated grid
grid.each do |row|
    p row
end

