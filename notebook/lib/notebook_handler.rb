module Notebook
  class Notebook
    @list

    def initialize
      @list = []
    end

    def add(person)
      @list.push(person) 
    end

    def remove(person)
      @list.delete(person)
    end

    def change_address(name, surename, patr, new_address)
      @list.each do |person|
        if person.name == name &&
            person.surename == surename &&
            person.patronymic == patr
          person.address = new_address
        end 
      end 
    end

    def change_phone(name, surename, patr, new_phone)
      @list.each do |person|
        if person.name == name &&
            person.surename == surename &&
            person.patronymic == patr
          person.cell_phone = new_phone
        end 
      end 
    end

    def sort
      @list.sort! { |p1, p2| yield(p1, p2) }
    end 
    
    def event(status)
      invited = []
      @list.each do |person|
        if person.status == status
          invited.push(person)
        end
      end
      return invited
    end

    def each
      @list.each { |person| yield(person) }
    end
  end
end
