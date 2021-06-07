def reverser(str, &prc)
    prc.call(str.reverse)
end

def word_changer(str, &prc)
    words = str.split(" ")
    words.each.with_index do |w,i|
        words[i] = prc.call(w)
    end
    return words.join(" ")
end

def greater_proc_value(num, proc_1, proc_2)
    nums = []
    nums << proc_1.call(num)
    nums << proc_2.call(num)

    return nums.max

end

def and_selector(arr, proc1, proc2)
    newarr = []

    arr.each do |ele|
        if proc1.call(ele) && proc2.call(ele)
            newarr << ele 
        end
    end

    return newarr
end

def alternating_mapper(arr, proc1, proc2)
    newarr = []

    arr.each_with_index do |ele,i|
        if i.even?
            newarr << proc1.call(ele)
        else
            newarr << proc2.call(ele)
        end
    end
    newarr
end