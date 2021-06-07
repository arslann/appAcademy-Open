def no_dupes?(arr)
    new_arr = []
    new_arr << arr.group_by{|e| e}.select {|k,v| v.length == 1}.map {|k,v| v}
    new_arr.flatten
end

#p no_dupes?([1, 1, 2, 1, 3, 2, 4]) 
#p no_dupes?(['x', 'x', 'y', 'z', 'z'])  
#p no_dupes?([true, true, true]) 

def no_consecutive_repeats?(arr)
    (0..arr.length - 1).each do |i| 
        if arr[i] == arr[i + 1]
            return false
        end
    end
    return true

end
#puts no_consecutive_repeats?(['cat', 'dog', 'mouse', 'dog'])  
#puts no_consecutive_repeats?(['cat', 'dog', 'dog', 'mouse'])
#puts no_consecutive_repeats?([10, 42, 3, 7, 10, 3])  
#puts no_consecutive_repeats?([10, 42, 3, 3, 10, 3]) 
#puts no_consecutive_repeats?(['x']) 

def char_indices(str)
    myHash = Hash.new {|h,k| h[k] = []}
    str.each_char.with_index do |char,idx|
        myHash[char] << idx
    end
    myHash

end

#p char_indices('mississippi')

def longest_streak(str)
    myHash = Hash.new(0)
    newstr = ""
    str.each_char do |char| 
        myHash[char] += 1

    end
    arr = myHash.max_by {|k,v| v}
    (0...arr[1]).each do 
        newstr += arr[0]
        
    end
    newstr
end

#puts longest_streak('accccbbb')

def bi_prime?(num)

    (2...num).each do |num1|
        (num1...num).each do |num2|
            if (is_prime?(num1) && is_prime?(num2)) && (num1 * num2 == num)
                return true
            end
        end
    end
    return false

end

def is_prime?(num)
    return true if num == 2
    (2...num).each do |n|
        if num % n == 0
            return false
        end
    end
    return true

end

#puts bi_prime?(14)
#puts bi_prime?(22)
#puts bi_prime?(94)
#puts bi_prime?(25)
#puts bi_prime?(24)
#puts bi_prime?(64)

def vigenere_cipher(message, keys)
    newstr = ""
    alpha = ("a".."z").to_a

    keys.each do |key|

    end

    message.each_char.with_index do |char, idx| 
        start_pos = alpha.index(char)
        key = keys[idx % keys.length]
        new_pos = (start_pos + key) % 26
        newstr += alpha[new_pos] 
    end

    newstr
end

#puts vigenere_cipher("toerrishuman", [1]) 
#puts vigenere_cipher("toerrishuman", [1, 2, 3])
#puts vigenere_cipher("zebra", [3, 0]) 

def vowel_rotate(str)
    vowels = "aeiou"
    firstidx = 0
    last = ""
    newstr = ""
    prev = nil
    str.each_char.with_index do |char, idx| 
        if vowels.include?(char) && prev == nil
            prev = char
            firstidx = idx
        end
        if vowels.include?(char) && prev != nil
            newstr += prev
            prev = char
            last = char
            
        else
            newstr += char
        end
    end
    newstr[firstidx] = last
    newstr
end
#puts vowel_rotate('computer')
#puts vowel_rotate('oranges') 
#puts vowel_rotate('headphones')
#puts vowel_rotate('awesome') 

class String
    def select(&prc)
        return "" if prc.nil?
        new_str = ""

        self.each_char do |char|
            new_str += char if prc.call(char)
        end
        new_str
    end

    def map!(&prc)
        self.each_char.with_index do |char, idx|
            self[idx] = prc.call(char, idx)
        end
        self

    end
end
#puts "app academy".select { |ch| !"aeiou".include?(ch) }
#puts "HELLOworld".select { |ch| ch == ch.upcase } 
#puts "HELLOworld".select    
# word_1 = "Lovelace"
# word_1.map! do |ch| 
#     if ch == 'e'
#         '3'
#     elsif ch == 'a'
#         '4'
#     else
#         ch
#     end
# end
# p word_1 

# word_2 = "Dijkstra"
# word_2.map! do |ch, i|
#     if i.even?
#         ch.upcase
#     else
#         ch.downcase
#     end
# end
# p word_2 

def multiply(a, b)
    return 0 if a == 0
    if a < 0
        -(b + multiply((-a) - 1, b))
    else
        b + multiply(a - 1, b)
    end
    

end

# puts multiply(3, 5)
# puts multiply(5, 3)
# puts multiply(2, 4) 
# puts multiply(0, 10)
# puts multiply(-3, -6)
# puts multiply(3, -6)
# puts multiply(-3, 6) 

def lucas_sequence(n)
    return [] if n == 0
    return [2] if n == 1
    return [2, 1] if n == 2

    arr = lucas_sequence(n - 1) 
    arr << arr[-1] + arr[-2]
    arr

end

# p lucas_sequence(2) 
# p lucas_sequence(3) 
# p lucas_sequence(6)   # => [2, 1, 3, 4, 7, 11]

def prime_factorization(num)
    (2...num).each do |n|
        if num % n == 0
            nt = num / n
            
            return [ *prime_factorization(n), *prime_factorization(nt) ]
        end
    end
    [num]
end

puts prime_factorization(12) 