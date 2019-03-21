# parses input of user and determine which
# command user wants to execute
require_relative 'notebook_handler'
require_relative 'input_handlers'
require_relative 'person'

module Notebook
  class Core 
    def initialize
      @notebook = Notebook.new
      @options = {
        'remove' => :remove,
        'add'          => :add,
        'caddress'  => :ch_address,
        'cphone' => :ch_phone,
        's surname'   => :sort_by_surname,
        's status'     => :sort_by_status,
        'event'        => :event,
        'exit'         => :exit
      }
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
        # debug
        puts @notebook
      end
    end

    private

    def add
      name = Input.string_input('Name: ')
      surname = Input.string_input('Surname: ')
      patr = Input.string_input('Patronymic: ')
      #      cell_phone = Input.num_input('Cell phone: ')
      #      home_phone = Input.num_input('Home phone: ')
      #      address = Input.string_input('Address(<Street> <Number of house>): ')
      status = Input.string_input('Status: ')

      person = Person.new(name, surname, patr, nil, nil, nil, status)
      #cell_phone, home_phone, address, status) 
      @notebook.add(person)
    end

    def remove
      name = Input.string_input('Name: ')
      surname = Input.string_input('Surname: ')
      patr = Input.tstring_input('Patronymic: ')
      # probably this is not a good solution
      person = Person.new(name, surname, patr, nil, nil, nil, nil)
      @notebook.remove(person)
    end

    def ch_address
      name = Input.string_input('Name: ')
      surname = Input.string_input('Surname: ')
      patr = Input.string_input('Patronymic: ')
      new_address = Input.string_input('New address(<Street> <Number of house>): ')
      @notebook.change_address(name, surname, patr, new_address)
    end

    def ch_phone
      name = Input.string_input('Name: ')
      surname = Input.string_input('Surname: ')
      patr = Input.string_input('Patronymic: ')
      new_phone = Input.num_input('New phone: ')
      @notebook.change_phone(name, surname, patr, new_phone)  
    end

    def sort_by_surname
      @notebook.sort { |p1, p2| p1.surname <=> p2.surname }
    end

    def sort_by_status
      @notebook.sort { |p1, p2| p1.status <=> p2.status }
    end

    def event
      event_name = Input.string_input('Name of event: ')
      status = Input.string_input('Status: ')
      invited = @notebook.event(event_name, status)
      invited.each do |person|
        # do invites for each person
      end
    end
  end
end
