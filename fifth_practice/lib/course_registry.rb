class CourseRegistry
  @all_courses
  def initialize
    @all_courses = []
  end

  def add(course)
    @all_courses.push(course)
  end
  
  def remove(course)
    @all_courses.deletee(course)
  end

  def each
    @all_courses.each { |value| yield(value)}
  end
end
