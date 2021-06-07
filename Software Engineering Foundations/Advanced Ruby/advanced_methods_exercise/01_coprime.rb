# Write a method, coprime?(num_1, num_2), that accepts two numbers as args.
# The method should return true if the only common divisor between the two numbers is 1.
# The method should return false otherwise. For example coprime?(25, 12) is true because
# 1 is the only number that divides both 25 and 12.
def coprime?(num_1, num_2)
    divide = []

    (1...num_1).each do |n|
        if num_1 % n == 0
            divide << n            
        end
    end
    d = divide.count { |el| num_2 % el == 0}
    return d == 1


end

p coprime?(25, 12)    # => true
p coprime?(7, 11)     # => true
p coprime?(30, 9)     # => false
p coprime?(6, 24)     # => false
