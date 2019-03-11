require_relative '../util/read_input'

print "Counts amount of sign changes in a array\n"

index_a = []
source_a = []

loop do
  temp = read_input_number("")
  break if temp.nil?
  source_a.push(Integer(temp))
end

p source_a

p_value = source_a[0]
index = 0
for value in source_a do
  if value < 0 && p_value > 0
    index_a.push(index)
  elsif value > 0 && p_value < 0
    index_a.push(index)
  end

  p_value = value
  index += 1
end
p index_a
p index_a.size  