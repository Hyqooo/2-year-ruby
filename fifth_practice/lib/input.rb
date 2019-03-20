require_relative '../../util/read_input'

class Input
  def input_grade
    number = read_input_number('Grade: ')
    return number
  end
  
  def choose_element(options)
    options.each { |index, option| puts "#{index} - #{option}" }
    number = read_input_number('Choose option: ')
    return number
  end 
end
