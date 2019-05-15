class Grade 
  attr_reader :course, :task, :grade
  def initialize(course, task, grade)
    @course = course
    @task = task
    @grade = grade
  end

  def to_s
    "#{course} - #{task} - #{grade}"
  end
end