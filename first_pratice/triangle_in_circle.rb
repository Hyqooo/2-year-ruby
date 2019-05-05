# checks if str contains only digits
def all_digits(str)
    if str[/[0-9]+\.[0-9]+/] == str || str[/[0-9]+/] == str
        return true
    end
    return false
end

# checks input and return length if it correct
def input(message)
    length = 0
    str_number = ""
    while true
        printf "Input %s ", message
        str_number = gets
        if all_digits(str_number.strip) == true
            length = str_number.to_f
            return length
        else
            puts "Input is incorrect, try again"
        end
    end
end

def square_of_triangle(a, b, c)
    # semiperimeter
    p = (a + b + c) / 2;
    # square
    Math.sqrt(p * (p - a) * (p - b) * (p - c))
end

def radius_circumscribed_circle(a, b, c, square)
    (a * b * c) / (4 * square)
end

puts "Input three sides of triangle and radius of circle"
puts "You will know can you place triangle inside circle or cannot"

side_a = 0
side_b = 0
side_c = 0
radius = 0
square = 0

side_a = input("length of side a")
side_b = input("length of side b")
side_c = input("length of side c")
radius = input("radius")

puts "length of a is %.3f" % [side_a]
puts "length of b is %.3f" % [side_b]
puts "length of c is %.3f" % [side_c]
puts "radius=%.3f" % radius

square = square_of_triangle(side_a, side_b, side_c)

if radius >= radius_circumscribed_circle(side_a, side_b, side_c, square)
    puts "You can place this triangle inside the circle"
else
    puts "You cannot place this triangle inside the circle"
end
