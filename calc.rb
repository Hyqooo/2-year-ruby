def print_result (sum)
    printf "Sum: %d\n", sum
end

puts "Adds entered number with previous numbers"

cur_number = 0
str_number = ""
sum = 0

while true
    putc '>'
    str_number = gets

    if str_number == nil || str_number.strip == "over"
        print_result(sum)
        break
    end

    cur_number = str_number.to_f
    sum += cur_number

    printf "Current number: %d\n", cur_number
    printf "Sum: %d\n", sum
end
