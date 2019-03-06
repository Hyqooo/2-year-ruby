require_relative "auto"
require_relative "fleet"

auto_1 = Auto.new("Honda", "Civic", 2007, 15)
auto_2 = Auto.new("Honda", "Civic", 2007, 12.2)
auto_3 = Auto.new("Honda", "Civic", 2007, 12.2)
auto_4 = Auto.new("Honda", "Civic", 2007, 12.2)
auto_5 = Auto.new("Honda", "Civic", 2007, 12.2)
auto_6 = Auto.new("Honda", "Civic", 2007, 12.2)
auto_7 = Auto.new("Honda", "Civic", 2007, 12)
auto_8 = Auto.new("Renault", "Logan", 2009, 13.1)
auto_9 = Auto.new("Renault", "Civic", 2007, 12.1)
auto_10 = Auto.new("Honda", "Civic", 2007, 12.2)

fleet = Fleet.new
fleet.add(auto_8)
fleet.add(auto_1)
fleet.add(auto_7)
fleet.add(auto_9)


puts auto_1
puts auto_8
pp fleet 
puts fleet.average_consumption
puts fleet.number_by_brand("Renault")
puts fleet.number_by_model("Logan")
puts fleet.consumption_by_brand("Renault")