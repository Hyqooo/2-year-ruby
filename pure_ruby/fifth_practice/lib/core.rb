require_relative 'dao'
require_relative 'input'
require_relative 'course_registry'

# Controls user input and decides what to do
class Core
  def initialize
    @options = { '-1' => 'Exit', '0' => 'Show courses' }
    dao = Dao.new
    @database = dao.read_db
  end

  def run
    @input = Input.new
    loop do
      number = @input.choose_element(@options)
      # exit
      break if number == -1

      choose(number)
    end
  end

  def choose(number)
    case number
    when 0
      show_courses
    else
      puts "There's no option with number #{number}"
    end
  end

  def show_courses
    @database.courses.each do |course|
      puts course.course_name
      course.each do |name, grade|
        puts "Id: #{name} - Grade: #{grade}"
      end
    end
  end
end

core = Core.new
core.run
