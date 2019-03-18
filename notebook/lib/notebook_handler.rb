module NotebookHandler
  class Notebook
    @list

    def initialize
      @list = []
    end

    def add(person)
      @list.push(person) 
    end

    def remove(person)
      # check if this method is appropriate
      @list.delete(person)
    end

    def change_name(person, name)
      @list.get(person).name = name
    end

    def change_phone(person, phone)
      @list.get(person).phone = phone
    end

    def sort_by_surename

    end

    def sort_by_status

    end

    def event(event)

    end
  end
end
