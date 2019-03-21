module Input 
  # to print message use message w/out '\n'
  def self.num_input(message)
    loop do
      print "#{message}"
      line = gets

      return nil if line.nil?

      return Float(line.strip)
    rescue ArgumentError => _exception
      puts 'incorrect input, try again'
    end
  end

  def self.string_input(message)
    loop do
      print "#{message}"
      line = gets

      if line.nil?
        puts 'This field cannot be empty!'
        next
      end
      line = line.strip
      if line.empty?
        puts 'This field cannot be empty!'
        next
      end
      return line
    end
  end
  
  def self.read_file()
    all_info = Psych.load_file('../data/data.yaml')
  end
end
