def average(num1, num2)
    return (num1 + num2) / 2.0
end

def average_array(arr)
    return arr.sum / arr.length.to_f
end

def repeat(str, num)
    newstr = ""
    num.times do
        newstr += str
    end
    return newstr
end

def yell(str)
    return str.upcase + "!"
end

def alternating_case(str)
    words = str.split(" ")
    words.each_with_index do |ele, i|
        if i % 2 == 1
            words[i] = ele.downcase
        else
            words[i] = ele.upcase
        end
    end
    return words.join(" ")
end 