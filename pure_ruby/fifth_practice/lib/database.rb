class Database
  attr_reader :courses, :students
  def initialize(courses, students)
    @courses = courses
    @students = students
  end
end
