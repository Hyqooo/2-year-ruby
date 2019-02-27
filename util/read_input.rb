# Different kind of parsers of input
def read_input_number(message)
  loop do
    print "#{message}"
    line = gets

    return nil if line.nil?

    return Float(line.strip)
  rescue ArgumentError => _exception
    puts "incorrect number, try again"
  end
end

def read_input_string(message)
  loop do 
    print "#{message}"
    line = gets

    if line.nil?
      puts "Empty field, try again"
      next
    end
    line = line.strip
    
    if line.empty?
      puts "Empty field, try again"      
      next
    end 
    
      return line

  end
end
