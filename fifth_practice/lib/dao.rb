require_relative 'database'
require_relative 'student_registry'
require_relative 'course_registry'
require_relative 'student'
require_relative 'course'
require 'psych'

class Dao
  def read_db
    all_info = Psych.load_file('../data/data.yaml')
    students = parse_students(all_info)
    p students
    courses = parse_courses(all_info)
    database = Database.new(courses, courses)
    return database
  end

  def parse_students(database)
    students = StudentRegistry.new
    database['students'].each do |student|
      student = Student.new(student['name'], student['surname'], student['id'])
      students.add(student) 
    end
    return students
  end

  def parse_courses(database)
    courses = CourseRegistry.new
    database['courses'].each do |course|
      course_name = course['name']
      new_course = Course.new(course_name)
      course['grades'].each do |student|
        new_course.set_grade(student['student_id'], student['grade'])
      end
      courses.add(new_course)
    end
    return courses
  end
end
