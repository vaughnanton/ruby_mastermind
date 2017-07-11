class MasterMind

	def initialize
		colors = %w{ red orange yellow green blue }
		@code = colors.sample(4).each do |color| end
		@turn = 1
	end


	def player_answer
		player_answer = gets.chomp.downcase.split
		@player_code = player_answer.each do |color| end
		puts "\nYour guess: #{@player_code}\n"
		if @code == @player_code then puts "\n\nYou Win!"
			play_again
		else compare
		end
	end


	def compare
			colors_wrong_spot = @code & @player_code
			length_colors_wrong_spot = colors_wrong_spot.length
			show_answer = @code.zip(@player_code).map {|x, y| x == y}
			random_show_answer = show_answer.sample(4)

				puts "\nYou guessed #{length_colors_wrong_spot} colors that are in the secret combination. \n"
				puts "\nTrue means you put a color in the correct position but you don't know which position beacuse the true/false is randomized...\n#{random_show_answer}\n"
	end


	def play
		while @turn <= 10
			puts "\nThis is turn #{@turn} of 10. Color list: red, orange, yellow, green, blue."
			@turn += 1
			player_answer
		end
			game_over
	end


	def game_over
		puts "\nGame Over! The correct combination was #{@code}. Want to play again? Y/N"
		if gets.chomp == "Y"
			new_game = MasterMind.new
			new_game.start
		else
			puts "\nExiting..."
			exit
		end
	end


	def play_again
		puts "\nWould you like to play again? Y/N"
		if gets.chomp == "Y"
			new_game = MasterMind.new
			new_game.start
		else
			puts "\nExiting..."
			exit
		end
	end


	def start
		puts "\nWelcome to MasterMind!"
		puts "There is a secret combination of 4 colors to be discovered within 10 tries!"
		puts "Type in 4 colors from the following list on each turn and try to guess the correct order: red, orange, yellow, green, blue."
		puts "When inputting your answer just type the color's name and a space between each color. NO COMMAS!"
		puts "Let's begin..."
		play
	end


end

new_game = MasterMind.new
new_game.start
