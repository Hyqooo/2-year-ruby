require_relative 'address'

module InputHandlers
  include Address
  # to print message uses function w/out '\n'
  def num_input(message)
    loop do
      print "#{message}"
      line = gets

      return nil if line.nil?

      return Float(line.strip)
    rescue ArgumentError => _exception
      puts 'incorrect input, try again'
    end
  end

  def string_input(message)
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
end
