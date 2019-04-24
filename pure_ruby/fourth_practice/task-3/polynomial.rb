require_relative '../../util/read_input'

def calc_value(polynomial, point)
  result = 0
  power = polynomial.size - 1

  polynomial.each_with_index do |value, index|
    result += value * (point**(power - index))
  end
  result
end

def derivative(polynomial)
  der_polynomial = []
  power = polynomial.size - 1
  # delete free member
  polynomial.pop
  polynomial.each_with_index do |value, index|
    der_polynomial.push(value * (power - index))
  end

  der_polynomial
end

def fill_array(polynomial, power)
  index = 0
  puts 'Input coeffs: '
  while index < power
    temp = read_input_number('')
    break if temp.nil?

    polynomial.push(temp)
    index += 1
  end
  polynomial
end

def main
  polynomial = []
  power = read_input_number('Input power: ') + 1

  polynomial = fill_array(polynomial, power)

  point = read_input_number('Input point: ')
  value = calc_value(polynomial, point)

  der_polynomial = derivative(polynomial)
  d_value = calc_value(der_polynomial, point)

  puts "Value at point #{point}: #{value}"
  puts "Value of derivative at point #{point}: #{d_value}"
end

main
