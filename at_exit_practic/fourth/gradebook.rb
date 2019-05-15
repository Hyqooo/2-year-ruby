class Gradebook
  def initialize
    @gradebook = []
  end

  def add(grade)
    @gradebook.push(grade)
  end

  def get
    return @gradebook
  end

  def each
    @gradebook.each { |grade| yield(grade) }
  end
end