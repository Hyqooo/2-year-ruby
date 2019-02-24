def print_results(correct, incorrect)
    printf "\nCorrect inputs: %d\n", correct
    printf "Incorrect inputs: %d\n", incorrect
end

def all_digits(str)
    # regular expression
    # actually this means substrig contains only 0-9 symbols, but at least one should be there
    str[/[0-9]+/] == str
end

puts "Checks if user entered positive integer number"

str_number = ""
number = 0
correct = 0
incorrect = 0

while true
    putc '>'
    str_number = gets

    if str_number == nil || str_number.to_f == 99.999
        print_results(correct, incorrect)
        break
    end
    
    if all_digits(str_number.strip) == true
        number = str_number.to_i
    else
        number = 0
    end

    if number <= 0
        puts "Retry input number is non-positive"
        incorrect += 1
    else 
        puts "Input is correct"
        correct += 1
    end
end
