require_relative '../../util/read_input'

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
source_a.each_with_index do |value, index|  
  if value < 0 && p_value > 0
    index_a.push(index)
  elsif value > 0 && p_value < 0
    index_a.push(index)
  end

  p_value = value
end

p index_a
p index_a.size  
