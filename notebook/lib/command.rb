# parses input of user and determine which
# command user wants to execute
require_relative 'notebook_handler'
require_relative 'input_handlers'
require_relative 'person'

module Parser
  class Parser
    include NotebookHandler
    include InputHandlers
    include Person
    def initialize
      @notebook = Notebook.new
      @options = {
        'remove' => :remove,
        'add'          => :add,
        'caddress'  => :ch_address,
        'cphone' => :ch_phone,
        's surename'   => :sort_by_surename,
        's status'     => :sort_by_status,
        'event'        => :event,
        'exit'         => :exit
      }
    end

    def parse
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
      name = string_input('Name: ')
      surename = string_input('Surename: ')
      patr = string_input('Patronymic: ')
#      cell_phone = num_input('Cell phone: ')
#      home_phone = num_input('Home phone: ')
#      address = string_input('Address(<Street> <Number of house>): ')
      status = string_input('Status: ')

      person = Person.new(name, surename, patr, nil, nil, nil, status)
      #cell_phone, home_phone, address, status) 
      @notebook.add(person)
    end

    def remove
      name = string_input('Name: ')
      surename = string_input('Surename: ')
      patr = string_input('Patronymic: ')
      # probably this is not a good solution
      person = Person.new(name, surename, patr, nil, nil, nil, nil)
      @notebook.remove(person)
    end

    def ch_address
      name = string_input('Name: ')
      surename = string_input('Surename: ')
      patr = string_input('Patronymic: ')
      new_address = string_input('New address(<Street> <Number of house>): ')
      @notebook.change_address(name, surename, patr, new_address)
    end

    def ch_phone
      name = string_input('Name: ')
      surename = string_input('Surename: ')
      patr = string_input('Patronymic: ')
      new_phone = num_input('New phone: ')
      @notebook.change_phone(name, surename, patr, new_phone)  
    end

    def sort_by_surename
      @notebook.sort_by_surename
    end

    def sort_by_status
      @notebook.sort_by_status 
    end

    def event
      event_name = string_input('Name of event: ')
      status = string_input('Status: ')
      invited = @notebook.event(event_name, status)
      invited.each do |person|
        # do invites for each person
      end
    end
  end
end
