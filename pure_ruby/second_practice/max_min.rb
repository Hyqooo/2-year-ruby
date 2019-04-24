require_relative "../util/read_input"

def max(first, second)
   if first > second
      return first
   end

   return second 
end

def min(first, second)
  if first < second
      return first
  end

  return second
end

def main
  a = read_input_number("Input number a: ")
  b = read_input_number("Input number b: ")
  c = read_input_number("Input number c: ")
  d = read_input_number("Input number d: ")

  maximum = max(min(a,b), min(c,d))
  puts "Maximum: #{maximum}"
end

main
