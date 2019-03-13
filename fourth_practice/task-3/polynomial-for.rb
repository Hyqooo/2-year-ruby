require_relative '../../util/read_input'

def calc_value(polynomial, point)
    result = 0
    power = polynomial.size - 1
    
    index = 0
    for value in polynomial do
      result += value * (point ** (power - index))
      index += 1
    end

    return result
end

def derivative(polynomial)
  der_polynomial = []
  power = polynomial.size - 1
  # delete free member
  polynomial.pop

    index = 0
    for value in polynomial do
      der_polynomial.push(value * (power - index))
      index += 1
    end

    return der_polynomial
end

def main
  polynomial = []
  power = read_input_number('Input power: ') + 1
  index = 0

  puts 'Input coeffs: '

  while index < power
    temp = read_input_number('')
    break if temp.nil?

    polynomial.push(temp)
    index += 1
  end

  point = read_input_number('Input point: ')
  value = calc_value(polynomial, point)

  der_polynomial = derivative(polynomial)
  d_value = calc_value(der_polynomial, point)

  puts "Value at point #{point}: #{value}"
  puts "Value of derivative at point #{point}: #{d_value}"
end

main
