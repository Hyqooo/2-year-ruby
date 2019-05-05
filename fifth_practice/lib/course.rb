class Course
  attr_reader :course_name
  def initialize(course_name)
    @course_name = course_name
    @students = Hash.new
  end

  def set_grade(student, grade)
    @students[student] = grade
  end

  def each
    @students.each { |key, value| yield(key, value) }
  end
end
