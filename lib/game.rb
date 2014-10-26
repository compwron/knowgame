class Game
	def initialize(common_files, tries)
		@common_files = common_files
		@tries = tries
		@record_keeper = {correct: 0, guesses: 0}
	end

	def play
		_print_instructions

		keep_going = true
		while keep_going 
			filename = @common_files.sample
			line = _random_line(filename)
			puts "line is: #{line}"
			puts "What file is this line from?"
			keep_going = _guess(filename, @tries)
			_print_end_report
		end
	end

	def _guess(filename, remaining_tries)
		if remaining_tries < 0
			_mercy filename
			return
		end
		current = gets.chomp
		case current
		when "done"
			_mercy filename
			false
		when "next"
			_mercy filename
			true
		else
			if current == filename
				puts "Correct!"
				@record_keeper[:correct] += 1
			else
				puts "You are wrong. Remaining tries: #{remaining_tries}"
				_guess(filename, remaining_tries - 1)
			end
		end
	end

	def _random_line filename
		s = File.readlines(filename).sample
		(s.empty? || s.strip == 'end') ? _random_line : s
	end

	def _mercy filename
		puts "out of chances. File was: #{filename}"
	end

	def _print_instructions
		puts "Type 'done' to end game
		To win the round, guess the filename which contains the line
		To give up and get new data, type 'next'"
	end

	def _print_end_report
		puts "Game score: #{@record_keeper}"
	end
end