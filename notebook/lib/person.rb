module Notebook 
  class Person
    attr_reader :name, :surname, :patronymic, :cell_phone, :home_phone, :address, :status
    attr_writer :cell_phone, :address

    def initialize(name, surname, patronymic, cell_phone,
                   home_phone, address, status)
      @name = name
      @surname = surname
      @patronymic = patronymic
      @cell_phone = cell_phone
      @home_phone = home_phone
      @address = address
      @status = status
    end

    def ==(other)
      @name == other.name &&
        @surname == other.surname &&
        @patronymic == other.patronymic
    end

    def to_s
      "\nName: #{@name}
Surename: #{@surname}
Patronymic: #{@patronymic}
Cell phone: #{@cell_phone}
Home phone: #{@home_phone}
Address: #{@address}
Status: #{@status}
      "
    end
  end
end
