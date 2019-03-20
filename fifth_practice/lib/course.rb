class Course
  @course_name
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

course1 = Course.new("Course")
p course1
course1.set_grade('petrov', 4)
p course1
course1.set_grade('ivanov', 5)
p course1
course1.set_grade('sidorov', 3)
p course1
course1.each { |key, value| puts "#{key}" if value == 3 }
course1.each { |key, value| puts 'privet' }