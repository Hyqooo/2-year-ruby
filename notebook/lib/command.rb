# parses input of user and determine which
# command user wants to execute
require_relative 'notebook_handler'

module Parser
  private
  $options = {
    'remove' => :remove,
    'add'          => :add,
    'change name'  => :ch_name,
    'change phone' => :ch_phone,
    's surename'   => :sort_surename,
    's status'     => :sort_status,
    'event'        => :event,
    'exit'         => :exit
  }
  class Parser
    include NotebookHandler 
   
    @notebook 
    def initialize
      @notebook = Notebook.new
    end

    def parse
      loop do
        print '> '
        line = gets
        break if line.nil?

        method = $options[line.strip]
        break if method == 'exit'
        unless method.nil?
          send(method)    
        else
          puts 'Unknown command, try again'
        end
      end
    end

    private
      def add
        @notebook.add("Hi")  
      end

      def remove
        puts 'remove'
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
