puts "Echo input of the user"

while true
    putc '>'

    str = gets

    if str.strip == "stop, please"
        break
    end

    puts str
    print str
    printf str
    p str
end
