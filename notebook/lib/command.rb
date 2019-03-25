# frozen_string_literal: true

require_relative 'notebook_handler'
require_relative 'input_handlers'
require_relative 'person'
require_relative 'options'

module Notebook
  # parses input of user and determine which
  # command user wants to execute
  class Core
    def initialize
      @options = { 'remove' => :remove, 'add' => :add, 'caddress' => :ch_address,
                   'cphone' => :ch_phone, 'ssurname' => :sort_by_surname, 'sstatus' => :sort_by_status,
                   'event' => :event, 'exit' => :exit, 'show' => :show, 'help' => :help }
      @notebook = Input.read_file
      help
    end

    def run
      loop do
        line = Input.string_input('> ')

        method = @options[line.strip]
        # method = Options.get(line.strip)
        break if method == 'exit'

        if method.nil?
          puts 'Unknown command, try again'
          next
        end

        # call given method
        send(method)
      end
    end

    private

    def add
      name = Input.string_input('Name: ')
      surname = Input.string_input('Surname: ')
      m_name = Input.string_input('Middle name: ')
      cell_phone = Input.phone_input('Cell phone: ')
      home_phone = Input.phone_input('Home phone: ')
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

      new_phone = Input.phone_input('New phone: ')
      @notebook.change_phone(name, surname, m_name, new_phone)
    end

    def sort_by_surname
      @notebook.sort(&:surname)
      show
    end

    def sort_by_status
      @notebook.sort(&:status)
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
      message += "#{person.address}\n" if Input.string_input('Add home address[y/n]?: ').casecmp?('y')

      message += "#{name}\n" + Input.string_input('Message: ')

      file.write(message)
      file.close
    end

    def show
      @notebook.each { |person| puts person }
    end

    def help
      help = {
        help: 'Shows this help',
        add: 'Adds new person in the notebook',
        remove: 'Removes person from the notebook',
        caddress: 'Changes address of specified person',
        cphone: 'Changes phone of specified person',
        ssurname: 'Sorts the notebook by surname',
        sstatus: 'Sorts the notebook by status',
        event: 'Creates event',
        show: 'Shows list of all persons in the notebook',
        exit: 'Exits this program'
      }
      help.each { |key, value| puts "#{key} - #{value}" }
    end
  end
end
