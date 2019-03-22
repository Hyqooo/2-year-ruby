module Notebook 
  class Person
    attr_reader :name, :surname, :m_name, :cell_phone, :home_phone, :address, :status
    attr_writer :cell_phone, :address

    def initialize(name, surname, m_name, cell_phone,
                   home_phone, address, status)
      @name = name
      @surname = surname
      @m_name = m_name 
      @cell_phone = cell_phone
      @home_phone = home_phone
      @address = address
      @status = status
    end

    def ==(other)
      @name == other.name &&
        @surname == other.surname &&
        @m_name == other.m_name
    end

    def to_s
      "\nName: #{@name}
Surname: #{@surname}
Middle name: #{@m_name}
Cell phone: #{@cell_phone}
Home phone: #{@home_phone}
Address: #{@address}
Status: #{@status}
      "
    end
  end
end
