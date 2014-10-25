class Game
	def initialize(common_files, tries)
		@common_files = common_files
		@tries = tries
		@record_keeper = {correct: 0, guesses: 0}
	end

	def play
		print_instructions

		keep_going = true
		while keep_going 
			file = @common_files.sample
			line = random_line(file)
			puts "line is: #{line}"
			puts "What file is this line from?"
			current = gets.chomp
			case current
			when "done"
				keep_going = false
			when "next"
				next
			else
				if current == file
					puts "Correct!"
					@record_keeper[:correct] += 1
				else
					@tries.downto(0).each { |try|
						puts "Try #{try}"
						current = gets.chomp
						@record_keeper[:correct] += 1 if current == file
					}
					puts "Out of tries..."
				end
			end
		end
		print_end_report
	end


	def random_line filename
		File.readlines(filename).sample
	end

	def print_instructions
		puts "Type 'done' to end game
		To win the round, guess the filename which contains the line
		To give up and get new data, type 'next'"
	end

	def print_end_report
		"Game score: #{@record_keeper}"
	end
end