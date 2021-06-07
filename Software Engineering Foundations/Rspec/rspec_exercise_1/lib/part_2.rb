def hipsterfy(str)
    vowels = "aeiou"
    rev = str.reverse
    rev.each_char.with_index do |char,i|
        if vowels.include?(char)
            rev[i] = ""
            break
        end
            
    end
    return rev.reverse
end

def vowel_counts(str)
    myHash = Hash.new(0)
    vowels = "aeiou"

    str.downcase.each_char do |char|
        if vowels.include?(char)
            myHash[char] += 1
        end

    end
    return myHash
end

def caesar_cipher(str, n)
    alphabet = "abcdefghijklmnopqrstuvwxyz"
    newstr = ""

    str.each_char do |char|
        if alphabet.include?(char)
            idx = alphabet.index(char)

            newstr += alphabet[(idx + n) % 26]
        else
            newstr += char
        end
        

    end
    return newstr

end