module NotebookHandler
  @notebook[]

  def add(person)
    notebook.push(person)
  end

  def remove(person)
    # check if this method is appropriate
    notebook.delete(person)
  end

  def change_name(person, name)
    notebook.get(person).name = name
  end

  def change_phone(person, phone)
    notebook.get(person).phone = phone
  end

  def sort_by_surename

  end

  def sort_by_status

  end

  def event(event)

  end
end
