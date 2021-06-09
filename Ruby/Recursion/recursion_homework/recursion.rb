def sum_to(n)
    return 1 if n == 1
    return nil if n < 1

    n + sum_to(n - 1)
end
# puts sum_to(5)
# puts sum_to(1)
# puts sum_to(9)
# p sum_to(-8)

def add_numbers(arr)
    return arr.first if arr.length == 1
    return nil if arr.length <= 0

    arr.shift + add_numbers(arr)

end

# puts add_numbers([1,2,3,4])
# puts add_numbers([3])
# puts add_numbers([-80,34,7])
# puts add_numbers([])

def gamma_fnc(n)
    return nil if n < 1
    return 1 if n == 1

    (n - 1) * gamma_fnc(n - 1)
    
end

# puts gamma_fnc(4)
# puts gamma_fnc(8)
# puts gamma_fnc(0)


def ice_cream_shop(flavors, favorite)
    return false if flavors.empty?
    return true if flavors.shift == favorite

    ice_cream_shop(flavors, favorite)
end

# puts ice_cream_shop(['vanilla', 'strawberry'], 'blue moon')
# puts ice_cream_shop(['pistachio', 'green tea', 'chocolate', 'mint chip'], 'green tea') 
# puts ice_cream_shop(['cookies n cream', 'blue moon', 'superman', 'honey lavender', 'sea salt caramel'], 'pistachio')
# puts ice_cream_shop(['moose tracks'], 'moose tracks')
# puts ice_cream_shop([], 'honey lavender')

def reverse(str)
    return "" if str.length == 0

    str[-1] + reverse(str[0...-1])

end

# puts reverse("house")
# puts reverse("dog")
# puts reverse("q")
# puts reverse("")