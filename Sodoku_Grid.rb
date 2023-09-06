# def display_sodoku
    input_string = "015003002000100906270068430490002017501040380003905000900081040860070025037204600"
    split_string = input_string.scan(/.{9}/).join("")

    split_string.chars.each_slice(9) do |row|
        puts row.join(", ")
    end
# end