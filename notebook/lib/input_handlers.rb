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

  def address_input(message)
    print "#{message}"
    street = string_input('')
    house_number = num_input('')
    return Address.new(street, house_number)
  end

  def phone_input(message)
    print "#{message}"
    phone = num_input('')
  end
end
