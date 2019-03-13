require_relative '../../util/read_input'

def delete(array)
  index = 0
  for value in array do
      array.delete(0)
  end

  return array
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