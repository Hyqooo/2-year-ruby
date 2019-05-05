class Auto
  attr_reader :brand, :model, :man_year, :gas_cons

  def initialize(brand, model, man_year, gas_cons)
    @brand = brand
    @model = model
    @man_year = Integer(man_year)
    @gas_cons = Float(gas_cons)
  end

  def to_s
    "Brand: #@brand\nModel: #@model\nYear of manufacturing: #@man_year\nGasoline consumption: #@gas_cons"
  end
end