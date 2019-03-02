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
  puts "Fill in all fields and get your profession"
  profession = ""

  name = read_input_string("Input name and surename: ")
  email = read_input_string("Input email: ")

  begin
    age = read_input_number("Input your age: ")
  end until correct_age?(age)

  experience = read_input_number("Input your work experience: ")

  if name.strip == "Pyotr Petrovich"
    profession = "Chief"
  else
    if email.include?("code")
      profession = "Engineer"
    elsif experience < 2
      profession = "Intern"
    elsif age >= 45 && age < 60 
      profession = "Veteran"
    end
  end

  if experience > 5
    profession = "Famous ".concat(profession)
  end

  if experience > 15  
    profession = "Honored ".concat(profession)
  end
   
  puts "Your profession: #{profession}"
end

main
