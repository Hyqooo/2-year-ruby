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

    def change_address(name, surename, m_name, new_address)
      @list.each do |person|
        if person.name == name &&
            person.surename == surename &&
            person.m_name == m_name
          person.address = new_address
        end 
      end 
    end

    def change_phone(name, surename, m_name, new_phone)
      @list.each do |person|
        if person.name == name &&
            person.surename == surename &&
            person.m_name == m_name 
          person.cell_phone = new_phone
        end 
      end 
    end

    def sort
      @list.sort_by! { |person| yield(person)  }
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
