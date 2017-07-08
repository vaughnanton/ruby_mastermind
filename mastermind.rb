class Game
  COLORS = ["R", "G", "B", "Y", "O", "P"]

  def initialize
    @comp = Computer.new
    @player = Player.new
  end
=begin
  def play
    12.times do |i|
      puts "This is chance #{i+1} of 12"
      current_guess = @player.guess
      standing = evaluate_guess(current_guess)

      if standing[:exact].length == 4
        puts "You won!"
        return
      else
        puts "#{standing[:exact].length} exact matches"
        puts "#{standing[:near].length} near matches"
      end
    end

    puts "12 chances complete, you lose!"
    return
  end

  def evaluate_guess(current_guess)
    results = { :exact => [], :near => [] }
    current_guess.each_with_index do |choice, position|
      if exact_match?(choice, position)
        results[:exact] << true
      elsif near_match?(choice)
        results[:near] << true
      end
    end
    results
  end

  def near_match?(choice)
    @comp.code_combination.include?(choice)
  end

  def exact_match?(choice,position)
    choice == @comp.code_combination[position]
  end
=end
end


class Computer
#code combination can be accessed but not changed
  attr_reader :code_combination

  def initialize
    @code_combination = code
  end

  def code
    colors = Game::COLORS.shuffle
    generated_code = []
    4.times { generated_code << colors.pop }
    generated_code
  end

end

class Player

  def guess
    puts "Please enter your guess by choosing one of the following: R, G, B, Y, O, P"
  end

  def convert_guess(guess)
    guess.split('')
  end

end

Game.new.play
