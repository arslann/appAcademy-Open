require "set"
require 'benchmark'
class WordChainer
    attr_reader :dictionary
    
    def initialize(filename)
        words = File.readlines(filename).map(&:chomp)
        @dictionary = Set.new(words)
    end
    def adjacent_words(word)

        length = word.length
    
        @same_length_words = @dictionary.select {|word| word.length == length}
        selected = []
        suffix = ""
        (0...length).each do |i|
            new_word = word[0...length - 1 - i]

           

            selected << @same_length_words.select {|word2| word2.start_with?(new_word)}


            suffix = word[length - 1 - i..-1]
            @same_length_words = @same_length_words.find_all {|word| word.end_with?(suffix) }
        end
        selected.flatten
    end
    
    
    def run(source, target)
        @target = target
        @current_words = [source]
        @all_seen_words = { source => nil }

        while !@current_words.empty?           
            explore_current_words          
        end

        p build_path(target)
    end

    def explore_current_words
        @new_current_words = []
        @current_words.each do |word|
            adjacent_words(word).each do |adj_word|
                if adj_word == @target
                    @all_seen_words[adj_word] = word
                    return @current_words = []    
                end
                if !@all_seen_words.include?(adj_word)
                    @new_current_words << adj_word
                    @all_seen_words[adj_word] = word
                end
            end
        end

        @current_words = @new_current_words
    end
    
    def build_path(target)
        path = []
        buffer = target
        until buffer == nil

            path << buffer
            buffer = @all_seen_words[buffer]

        end
        path.reverse
    end
    
    
end
test = WordChainer.new("dictionary.txt")

puts Benchmark.measure { test.run("duck", "ruby") }