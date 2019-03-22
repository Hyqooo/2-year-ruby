module Notebook
  # Describes address
  class Address
    def initialize(street, house_number)
      @street = street
      @house_number = house_number
    end

    def to_s
      "#{@street}, #{@house_number} "
    end
  end
end
