require_relative "read_input"

def continue?
  print 'Continue? [Yes/No]> '
  decision = gets
  return true if decision.nil?

  decision = decision.strip
  return true if decision.empty?

  decision[0].downcase == 'y'
end

def main
  start_value = read_input("Input value of investment ")
  status_value = start_value

  while continue?
    game_value = rand(15)
    case game_value
    when 14
      status_value = status_value * 1.10
    when 12
      status_value = status_value * 1.02
    when 7
      status_value = status_value * 0.98
    when 5
      status_value = status_value * 0.9
    else
      status_value = status_value * 0.5
    end

    print "#{status_value}\n"
  end

  print "#{status_value}\n"
end

main