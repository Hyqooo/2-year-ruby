# frozen_string_literal: true

# all options that are available
module Options
  @options = {
    'remove' => :remove,
    'add' => :add,
    'caddress' => :ch_address,
    'cphone' => :ch_phone,
    's surname' => :sort_by_surname,
    's status' => :sort_by_status,
    'event' => :event,
    'exit' => :exit,
    'show' => :show
  }

  def self.get(option)
    @options[option]
  end
end
