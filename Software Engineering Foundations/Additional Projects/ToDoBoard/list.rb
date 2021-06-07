require_relative "item.rb"
class List
    attr_accessor :label

    def initialize(label)
        @label = label
        @items = []
    end

    def add_item(title, deadline, description = "")
        return false if !Item.valid_date?(deadline)

        @items << Item.new(title, deadline, description)
        return true
    end

    def size
        @items.length
    end

    def valid_index?(index)
        0 <= index && index < self.size 
    end

    def swap(index_1, index_2)
        return false if !valid_index?(index_1) && !valid_index?(index_2)

        @items[index_1], @items[index_2] = @items[index_2], @items[index_1]
        return true
    end

    def [](index)
        return nil if !valid_index?(index)

        @items[index]
    end

    def priority
        @items.first
    end

    def print
        puts "------------------------------------------"
        puts "                #{self.label}        "
        puts "------------------------------------------"
        puts "Index | Item                 | Deadline   | Done?"
        @items.each_with_index do |item, idx|
            status = item.done ? "+" : " "
            puts "#{idx.to_s.ljust(5)} | #{item.title.ljust(20)} | #{item.deadline.ljust(7)} | [#{status}]"
        end
        puts "------------------------------------------"
    end
    
    def print_full_item(index)
        return nil if !valid_index?(index)
        item = self[index]

        puts "------------------------------------------"
        puts "Title: #{item.title.ljust(15)} Until: #{item.deadline}"
        puts "Description: #{item.description}"
        puts "Is it done?: #{item.done}"
        puts "------------------------------------------"
    end

    def print_priority
        print_full_item(0)
    end

    def up(index, amount = 1)
        return false if !valid_index?(index)
        while amount > 0 && index != 0 
            swap(index, index - 1)
            index -= 1
            amount -= 1
        end
    end

    def down(index, amount = 1)
        return false if !valid_index?(index)
        while amount > 0 && index != size - 1 
            swap(index, index + 1)
            index += 1
            amount -= 1
        end
    end

    def sort_by_date!
        @items.sort_by! {|item| item.deadline}
    end

    def toggle_item(index)
        @items[index].toggle
    end
    
    def remove_item(index)
        return false if !valid_index?(index)

        @items.delete_at(index)

        return true
    end

    def purge
        @items.delete_if(&:done)
    end

end

