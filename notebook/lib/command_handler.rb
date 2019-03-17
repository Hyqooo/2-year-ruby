# Handles user input and do needed operation
# for specified command
require_relative 'person'

module Command
  include Person

  def add(message)
    puts message
  end

  def remove
    
  end

  def ch_name
    p 'ch name'
  end

  def ch_phone
    p 'ch phone'
  end

  def sort_surename
    p 'sort surename'
  end

  def sort_status
    p 'sort status'
  end

  def event
    p 'event'
  end
end
