class Code

  attr_reader :pegs

  POSSIBLE_PEGS = {
    "R" => :red,
    "G" => :green,
    "B" => :blue,
    "Y" => :yellow
  }
  def self.valid_pegs?(arr)
    return arr.all? {|ele| POSSIBLE_PEGS.include?(ele.upcase)}
  end

  def initialize(pegs)
    return raise_error if !Code.valid_pegs?(pegs)
    @pegs = pegs.map {|ele| ele.upcase}
  end

  def self.random(length)
    pegs = Array.new(length) { Code::POSSIBLE_PEGS.keys.sample}
    Code.new(pegs)
  end

  def self.from_string(str)
    arr = str.split("")
    Code.new(arr)
  end
  def [](idx)
    @pegs[idx]
  end

  def length
    @pegs.length
  end

  def num_exact_matches(guess_code)
    (0...guess_code.length).count { |i| guess_code[i] == @pegs[i] }
  end

  def num_near_matches(guess_code)
    num_matches = (0...guess_code.length).count do |i|
      guess_peg = guess_code[i]
      @pegs.include?(guess_peg)
    end

    num_matches - self.num_exact_matches(guess_code)
  end
  def ==(code2)
   return num_exact_matches(self) == num_exact_matches(code2)
  end
end
