class MyComplex
  attr_reader :real, :imaginary
  
  def initialize(real, imaginary)
    @real = Float(real)
    @imaginary = Float(imaginary)
  end

  def add(other)
    real = @real + other.real
    imaginary = @imaginary + other.imaginary
    MyComplex.new(real, imaginary)
  end

  def sub(other)
    real = @real - other.real
    imaginary = @imaginary - other.imaginary
    MyComplex.new(real, imaginary)
  end

  def multiply(other)
    real = @real * other.real - @imaginary * other.imaginary
    imaginary = @real * other.imaginary + @imaginary * other.real
    MyComplex.new(real, imaginary)
  end

  def divide(other)
    newComplexNumber = multiply(MyComplex.new(other.real, -other.imaginary)) 
    real = newComplexNumber.real / (other.real * other.real + other.imaginary * other.imaginary)
    imaginary = newComplexNumber.imaginary / (other.real * other.real + other.imaginary * other.imaginary)
    MyComplex.new(real, imaginary)
  end

  def to_s
    "#@real + i * #@imaginary"
  end
end