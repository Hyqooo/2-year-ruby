require_relative '../../util/read_input'

def delete(array)
    array.delete_if {|value| value == 0}
end

def main
    puts "Input numbers"
    
    array_c = []
    loop do
        temp = read_input_number("")
        break if temp.nil?
        array_c.push(temp)
    end

    p array_c
    array_c = delete(array_c)
    p array_c
end

main
