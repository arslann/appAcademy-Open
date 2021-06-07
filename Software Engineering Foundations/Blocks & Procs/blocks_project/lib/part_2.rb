def all_words_capitalized?(arr)
    arr.all? {|word| word == word.capitalize }
end

def no_valid_url?(arr)
    urls = [".com", ".net", ".io", ".org"]
    arr.none? do |url|
        urls.any? {|ele| url.end_with?(ele) }
    end

end

def any_passing_students?(students)
    students.any? do |student| 
        (student[:grades].sum / student[:grades].size) >= 75
    end
end