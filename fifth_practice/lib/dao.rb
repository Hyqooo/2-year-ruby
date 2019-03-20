require_relative 'database'
require_relative 'student_registry'
require_relative 'course_registry'

class Dao
  def read_db
    database = Database.new(StudentRegistry.new, CourseRegistry.new)
    return database
  end
end