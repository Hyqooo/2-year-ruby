require 'psych'

class Student
  attr_accessor :name, :surname, :id
  def initialize(name, surname, id)
    @name = name
    @surname = surname
    @id = id
  end
end
