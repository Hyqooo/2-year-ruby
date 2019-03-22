require_relative 'notebook_handler'
require_relative 'input_handlers'
require_relative 'person'

module Notebook
  # parses input of user and determine which
  # command user wants to execute
  class Core
    def initialize
      @notebook = Input.read_file
      @options = {
        'remove' => :remove,
        'add' => :add,
        'caddress' => :ch_address,
        'cphone' => :ch_phone,
        's surname' => :sort_by_surname,
        's status'     => :sort_by_status,
        'event'        => :event,
        'exit'         => :exit,
        'show'         => :show
      }
      show
    end

    def run
      loop do
        print '> '
        line = gets
        break if line.nil?

        method = @options[line.strip]
        break if method == 'exit'
        if method.nil?
          puts 'Unknown command, try again'
        else
          send(method)
        end
      end
    end

    private

    def add
      name = Input.string_input('Name: ')
      surname = Input.string_input('Surname: ')
      m_name = Input.string_input('Middle name: ')
      cell_phone = Input.num_input('Cell phone: ')
      home_phone = Input.num_input('Home phone: ')
      address = Input.string_input('Address(<Street> <Number of house>): ')
      status = Input.string_input('Status: ')
      
      person = Person.new(name, surname, m_name, cell_phone,
                          home_phone, address, status)
      @notebook.add(person)
    end

    def remove
      name = Input.string_input('Name: ')
      surname = Input.string_input('Surname: ')
      m_name = Input.string_input('Middle name: ')
      
      person = Person.new(name, surname, m_name, nil, nil, nil, nil)
      @notebook.remove(person)
    end

    def ch_address
      name = Input.string_input('Name: ')
      surname = Input.string_input('Surname: ')
      m_name = Input.string_input('Middle name: ')
      
      new_address = Input.string_input('New address(<Street> <House number>): ')
      @notebook.change_address(name, surname, m_name, new_address)
    end

    def ch_phone
      name = Input.string_input('Name: ')
      surname = Input.string_input('Surname: ')
      m_name = Input.string_input('Patronymic: ')
      
      new_phone = Input.num_input('New phone: ')
      @notebook.change_phone(name, surname, m_name, new_phone)
    end

    def sort_by_surname
      @notebook.sort { |p1, p2| p1.surname <=> p2.surname }
      show
    end

    def sort_by_status
      @notebook.sort { |p1, p2| p1.status <=> p2.status }
      show
    end

    def event
      event = Input.string_input('Name of the event: ')
      status = Input.string_input('Status: ')

      invited = @notebook.event(status)
      invited.each do |person|
        file_wr(person, event)
      end
    end

    def file_wr(person, event)
      message = ''
      name = "#{person.surname} #{person.name} #{person.m_name}"
      file = File.new(name, 'w')

      message += "#{event}\n"
      if Input.string_input('Add home address[y/n]?: ').casecmp?('y')
        message += "#{person.address}\n"
      end

      message += "#{name}\n" + Input.string_input('Message: ')

      file.write(message)
      file.close
    end

    def show
      @notebook.each { |person| puts person }
    end
  end
end
