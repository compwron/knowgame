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
			filename = @common_files.sample
			line = random_line(filename)
			puts "line is: #{line}"
			puts "What file is this line from?"
			guess(filename, @tries)
			print_end_report
		end
	end

	def guess(filename, remaining_tries)
		if remaining_tries < 0
			puts "out of chances. File was: #{filename}"
			return
		end
		current = gets.chomp
		case current
		when "done"
			keep_going = false
		when "next"
			nil
		else
			if current == filename
				puts "Correct!"
				@record_keeper[:correct] += 1
			else
				puts "You are wrong. Remaining tries: #{remaining_tries}"
				guess(filename, remaining_tries - 1)
			end
		end
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