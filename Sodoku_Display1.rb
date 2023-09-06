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
for row in grid
    p row
end

puts "\nfirst row : #{grid.first()}\n\n" # output print => the first row [0, 1, 5, 0, 0, 3, 0, 0, 2]

first_element = grid[0][0]
puts "first element : #{first_element}"

