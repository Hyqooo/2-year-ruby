require_relative '../util/read_input'

print "Prints values that power of two\n"

source_a = []

loop do
  temp = read_input_number("")
  break if temp.nil?
  source_a.push(temp)
end

p source_a

powered_index = 1
power = 1
index = 0
for value in source_a do
    if index == powered_index
        print(value, " ")
        powered_index = 2 ** power
        power += 1
    end
    index += 1
end
