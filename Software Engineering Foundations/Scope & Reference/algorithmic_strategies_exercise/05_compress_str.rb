# Write a method, compress_str(str), that accepts a string as an arg.
# The method should return a new str where streaks of consecutive characters are compressed.
# For example "aaabbc" is compressed to "3a2bc".
def compress_str(str)
    compres = Hash.new(0)
    s = ""

    str.each_char do |char|
        compres[char] += 1
    end
    compres.each do |k,v|
        if v > 1
            s += v.to_s
            s += k.to_s
        else
            s += k.to_s
        end
        
    end
    return s

end

p compress_str("aaabbc")        # => "3a2bc"
p compress_str("xxyyyyzz")      # => "2x4y2z"
p compress_str("qqqqq")         # => "5q"
p compress_str("mississippi")   # => "mi2si2si2pi"
