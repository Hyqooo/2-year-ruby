require_relative "my_complex"

c1 = MyComplex.new(1, 2)
c2 = MyComplex.new(1, 1)

puts c1
puts c2
puts c1.add(c2)
puts c1.sub(c2)
puts c1.multiply(c2)
puts c1.divide(c2)