def process(number)
  str_rep = ""
  case number
  when 1..9
    str_rep << one_to_nine(number)
  when 10..19  
    str_rep << ten_to_nineteen(number)
  when 20..99
    str_rep << tw_to_nt(number)
  else
    str_rep = "one hundred"
  end
  str_rep
end

def one_to_nine(number)
  return "" if number.zero?
  o_to_t = ["one", "two", "three", "four", "five", "six", "seven", "eight", "nine"]
  o_to_t[number - 1]
end

def ten_to_nineteen(number)
  t_to_t = { 10 => "ten", 11 => "eleven", 12 => "twelve", 15 => "fifteen"}
  num = t_to_t[number]
  if num.nil?
    num = one_to_nine(number % 10)
    num << "teen"
  end
  num
end

def tw_to_nt(number)
  case number
  when 50..59
    num = "fifty"
  when 20..29
    num = "twenty"
  when 30..39
    num = "thirty"
  end
  if num.nil?
    num = one_to_nine((number - number % 10) / 10 )
    num << "ty"
  end
  num << " #{one_to_nine(number % 10)}"
end

def main
  numbers = []
  ARGV.each do |line| 
    line.each_line(",") { |n| numbers.push(Integer(n.sub(/,/, '').strip)) }
  end
  numbers.each { |n| puts "#{n} - #{process(n)}" }
end

main