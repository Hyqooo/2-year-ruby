require_relative 'notebook_handler'
require_relative 'person'
require 'psych'

module Input 
  include Notebook
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

  def self.phone_input(message)
    loop do
      line = string_input(message)
      # delete all spaces in the string
      line.gsub!(/\s+/, "")

      # parse only valid phone numbers
      # (+ or NUMBER)NUMBERS
      if line.match?(/^(([+]|\d)\d+)$/)
        return line
      else
        puts 'Invalid number, try again'
      end 
    end
  end
  
  def self.read_file
    notebook = Notebook.new
    all_info = Psych.load_file('../data/data.yaml')
    all_info.each do |person| 
      name = person['name']
      surname = person['surname']
      patr = person['patronymic']
      cell_phone = person['cell phone']
      home_phone = person['home phone']
      address = person['address']
      status = person['status']
      new_person = Person.new(name, surname, patr, cell_phone,
                              home_phone, address, status)
      notebook.add(new_person)
    end
    return notebook
  end
end
