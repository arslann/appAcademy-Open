def my_map(arr, &prc)
    newarr = []

    arr.each {|ele| newarr << prc.call(ele)}

    newarr

end

def my_select(arr, &prc)
    newarr = []

    arr.each do |ele|
        if prc.call(ele)
            newarr << ele
        end
    end

    newarr
end


def my_count(arr, &prc)
    count = 0

    arr.each do |ele|
        if prc.call(ele)
            count += 1
        end
    end
    count
end

def my_any?(arr, &prc)
    bool = false
    arr.each do |ele|
        if prc.call(ele)
            bool = true
        end
    end
    return bool
end

def my_all?(arr, &prc)
    bool = true
    arr.each do |ele|
        if !prc.call(ele)
            bool = false
        end
    end
    return bool
end

def my_none?(arr, &prc)
    bool = true

    arr.each do |ele|
        if prc.call(ele)
            bool = false
        end
    end
    return bool
end