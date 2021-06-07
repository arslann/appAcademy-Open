class Hangman
  DICTIONARY = ["cat", "dog", "bootcamp", "pizza"]
  def self.random_word
    return DICTIONARY.sample
  end

  def initialize
    @secret_word = Hangman.random_word
    @guess_word = @secret_word.split("").map {|ele| ele = "_"}
    @attempted_chars = []
    @remaining_incorrect_guesses = 5
  end

  def guess_word
    @guess_word
  end

  def attempted_chars
    @attempted_chars
  end

  def remaining_incorrect_guesses
    @remaining_incorrect_guesses
  end

  def already_attempted?(char)
    return @attempted_chars.include?(char)
  end

  def get_matching_indices(char)
    newarr = []
    @secret_word.each_char.with_index do |c, i| 
      if c == char
        newarr << i
      end
    end
    return newarr
  end

  def fill_indices(char, indices)
    indices.each do |i|
       @guess_word[i] = char
    end
  end

  def try_guess(char)

    if already_attempted?(char)
      puts "that has already been attempted"
      return false
    end
    attempt = self.get_matching_indices(char)
    @attempted_chars << char
    if attempt.length < 1
      @remaining_incorrect_guesses -= 1
      return true
    else
      self.fill_indices(char, attempt)
      return true
    end
  end

  def ask_user_for_guess
    puts "Enter a char:"
    input = gets.chomp
    return try_guess(input)
  end

  def win?
    if @secret_word == @guess_word.join("")
      puts "WIN"
      return true
    else
      return false
    end
  end

  def lose?
    if @remaining_incorrect_guesses == 0
      puts "LOSE"
      return true
    else 
      return false
    end
  end
  def game_over?
    if win? || lose?
      puts @secret_word
      return true
    else
      return false
    end
  end
end
