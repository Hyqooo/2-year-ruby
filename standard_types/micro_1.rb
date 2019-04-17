def div_five(min, max)
  numbers = []
  (min..max).each do |n|
    n = Integer(n)
    numbers.push(n) if n.modulo(5).zero?
  end
  numbers
end

def div_three(min, max)
  numbers = []
  (min..max).each do |n|
    n = Integer(n)
    numbers.push(n) if n.modulo(3).zero?
  end
  numbers
end

def div_threeteen(min, max)
  numbers = []
  (min..max).each do |n|
    n = Integer(n)
    numbers.push(n) if n.modulo(13).zero?
  end
  numbers
end

def main
  min_bound = ARGV[0]
  max_bound = ARGV[1]

  puts "modulo 5: #{div_five(min_bound, max_bound)}"
  puts "modulo 3: #{div_three(min_bound, max_bound)}"
  puts "modulo 13: #{div_threeteen(min_bound, max_bound)}"
end

main
