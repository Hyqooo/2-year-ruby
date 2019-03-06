class Fleet
  def initialize
    @cars = []
  end

  def add(car)
    @cars.push(car)
  end

  def average_consumption
    sum = 0
    @cars.each do |car|
      sum += car.gas_cons
    end

    sum / @cars.size
  end

  def number_by_brand(brand)
    @cars.count{|car| car.brand == brand}
  end

  def number_by_model(model)
    @cars.count{|car| car.model == model}
  end

  def consumption_by_brand(brand)
    selected_cars = @cars.select {|car| car.brand == brand }
    consumption = selected_cars.map { |car| car.gas_cons }
    consumption.reduce(:+) / consumption.size
  end
end