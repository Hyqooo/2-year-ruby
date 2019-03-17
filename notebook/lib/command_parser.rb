# parses input of user and determine which
# command user wants to execute
require_relative 'command_handler'

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
    include Command
    def parse
      loop do
        line = gets
        break if line.nil?

        method = $options[line.strip]
        break if method == 'exit'

        send(method) unless method.nil?
      end
    end
  end
end
