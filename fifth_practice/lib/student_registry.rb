class StudentRegistry
  @all_students

  def initialize
    @all_students = []
  end

  def add(student)
    @all_students.push(student)
  end

  def remove(student)
    @all_students.delete(student)
  end

  def each
    @all_students.each { |value| yield(value)}
  end
end