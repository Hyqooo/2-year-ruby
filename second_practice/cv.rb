require_relative "../util/read_input"

def correct_age?(age)
  case age
  when 15..100
    return true
  else
    return false
  end
end

def main
  name = read_input_string("Input name and surename: ")
  puts "#{name}"
  email = read_input_string("Input email: ")
  puts "#{email}"


  begin
    age = read_input_number("Input your age: ")
  end until correct_age?(age)

end

main
