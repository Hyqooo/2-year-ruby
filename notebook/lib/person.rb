module Person
  class Person
    attr_reader :name, :surename, :patronymic, :cell_phone, :home_phone, :address, :status
    attr_writer :cell_phone, :address

    def initialize(name, surename, patronymic, cell_phone,
                   home_phone, address, status)
      @name = name
      @surename = surename
      @patronymic = patronymic
      @cell_phone = cell_phone
      @home_phone = home_phone
      @address = address
      @status = status
    end

    def ==(other)
      name == other.name &&
        surename == other.surename &&
        patronymic == other.patronymic
    end

    def to_s
      "\nName: #{@name}
Surename: #{@surename}
Patronymic: #{@patronymic}
Cell phone: #{@cell_phone}
Home phone: #{@home_phone}
Address: #{@address}
Status: #{@status}
      "
    end
  end
end
