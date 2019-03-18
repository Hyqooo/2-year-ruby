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
        'change name'  => :ch_name,
        'change phone' => :ch_phone,
        's surename'   => :sort_surename,
        's status'     => :sort_status,
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
        p @notebook
      end
    end

    private

    def add
      name = string_input('input name: ')
      surename = string_input('input surename: ')
      patr = string_input('input patronymic: ')
      cell_phone = phone_input('input cell phone: ')
      home_phone = phone_input('input home phone: ')
      address = address_input('input address<Street>, <Number of house>: ')
      status = string_input('input status: ')

      person = Person.new(name, surename, patr, cell_phone, home_phone, address, status) 
      @notebook.add(person)
    end

    def remove
      line = gets
      @notebook.remove(line)
    end

    def ch_name
      # ...
    end

    def ch_phone
      # ...
    end

    def sort_by_name
      # ...
    end

    def sort_by_status
      # ...
    end

    def event
      # ...
    end
  end
end
