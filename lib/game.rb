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
			lines = File.readlines(filename)
			combo = _random_line(lines)
			line = combo.line
			line_num = combo.line_num
			puts "line is: #{line}"
			puts "What file is this line from?"
			keep_going = _guess(filename, @tries, combo)
			_print_end_report
		end
	end

	def _guess(filename, remaining_tries, combo)
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
				puts "expanded context:"
				puts _expanded_context(combo)
				_guess(filename, remaining_tries - 1, combo)
			end
		end
	end

	def _expanded_context combo
		puts combo.surrounding_lines
	end

	def _random_line lines
		Combo.new(lines)
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

class Combo
	attr_accessor :line_num, :line

	def initialize lines
		@lines = lines
		@line_num = _select_line(lines)
		@line = lines[line_num]
	end

	def _select_line lines
		line_num = rand(lines.length)
  		s = lines[line_num]
		(s.empty? || s.strip.downcase == 'end') ? _select_line(lines) : line_num
	end

	def surrounding_lines
		puts @lines[line_num - 1]
		puts @lines[line_num]
		puts @lines[line_num + 1]
	end
end