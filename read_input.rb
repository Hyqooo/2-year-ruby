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