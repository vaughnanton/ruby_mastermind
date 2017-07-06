class Mastermind
  COLORS = ["R", "G", "B", "Y", "O", "P"]

  def initialize
    @comp = Computer.new
    @player = Player.new
  end

  def play
    12.times do |i|
      puts "This is chance #{i+1} of 12"


class Computer

  def initialize
  end
  
end

class Player

  def guess
    puts "Please enter your guess by choosing one of the following: "R", "G", "B", "Y", "O", "P""
  end

  def convert_guess(guess)
    guess.split('')
  end

end
