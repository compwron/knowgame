class Game
	def initialize(common_files)
		@common_files = common_files
		# record keeper someday
	end

	def play
		print_instructions
		# pick a file
		# find # of lines in file
		# find non-empty line
		# keep number
		keep_going = true
		while keep_going 
			current = gets.chomp
			puts "line is: JHLHL"
			keep_going = (current != 'done')
		end
		print_end_report
	end

	def print_instructions
		puts "Type 'done' to end game
		To win the round, guess the filename which contains the line
		To give up and get new data, type 'next'"
	end

	def print_end_report
		"Game score: unknown"
	end
end