require_relative 'gradebook'
require_relative 'grade'
require 'pstore'

@gradebook = Gradebook.new
@gradebook.add(Grade.new("course1", "task1", 5))
@gradebook.add(Grade.new("course2", "task2", 5))
@gradebook.add(Grade.new("course3", "task3", 5))
@gradebook.add(Grade.new("course4", "task4", 5))

def save_pstore(path)
  store = PStore.new(path)
  store.transaction do
    store[:gradebook] = @gradebook
  end
end

def read_pstore(path)
  read = PStore.new(path)
  read.transaction do
    grades = read[:gradebook]
    @gradebook = grades if grades
  end
end

@gradebook.add(Grade.new("course5", "task5", 5))
@gradebook.add(Grade.new("course6", "task6", 5))

read_pstore("./data.pstore")

pp @gradebook