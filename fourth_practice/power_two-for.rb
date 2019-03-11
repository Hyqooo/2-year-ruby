require_relative '../util/read_input'

def is_power_of_two(number)
  power = 0
  result = 0
  while result < number
    result = 2 ** power
    if result == number
      return true
    end
    power += 1
  end

  return false
end

print "Prints values that power of two\n"

source_a = []

loop do
  temp = read_input_number("")
  break if temp.nil?
  source_a.push(temp)
end

p source_a
index = 0
for value in source_a do
  print(value, " ") if is_power_of_two(index)
  index += 1
end