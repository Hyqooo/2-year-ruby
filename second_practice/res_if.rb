def read_input(message)
  loop do
    print "#{message}"
    line = gets

    return nil if line.nil?

    return Float(line.strip)
  rescue ArgumentError => _exception
    puts "incorrect number, try again"
  end
end

number = read_input("input float number ")

if number > 0
  puts "positive number"
elsif number < 0
  puts "not positive but negative number"
else
  puts "unknown number"  
end