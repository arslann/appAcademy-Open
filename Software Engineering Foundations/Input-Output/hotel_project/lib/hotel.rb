require_relative "room"

class Hotel
  def initialize(name, roomHash)
    @name = name
    @rooms = {}
    roomHash.each {|k,v| @rooms[k] = Room.new(v)}
  end
  def name
    return (@name.split(" ").map {|word| word.capitalize}).join(" ")
  end
  def rooms
    return @rooms
  end
  def room_exists?(roomname)
    return rooms.has_key?(roomname)
  end
  def check_in(person, roomname)
    return puts "sorry, room does not exist" if !room_exists?(roomname)
    success = @rooms[roomname].add_occupant(person)
    if success
      puts "check in successful"
    else
      puts "sorry, room is full"
    end
  end
  def has_vacancy?
    @rooms.values.any? {|room| !room.full?} 
  end
  def list_rooms
    @rooms.each {|name, room| puts "#{name} : #{room.available_space}"}
  end
end
