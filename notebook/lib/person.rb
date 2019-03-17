module Person
  class Person
    attr_reader :name, :surename, :patronymic, :cell_phone, :home_phone, :address, :status
    attr_writer :cell_phone, :home_phone
    @name
    @surename
    @patronymic
    @cell_phone
    @home_phone
    @address
    @status

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
  end
end
