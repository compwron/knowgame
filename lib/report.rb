class Report
	def initialize
		@guessed_files = []
		@correct_guessed_files = []
	end

	def guessed filename, successful
		_add_unique(@guessed_files, filename)
		successful ? _add_unique(@correct_guessed_files, filename) : nil
	end

	def _add_unique collection, filename
		(collection << filename).uniq
	end

	def summary
		"Files guessed at: #{@guessed_files.count}\nFiles:\n#{@guessed_files.join("\n")}\nCorrect guesses: #{@correct_guessed_files.count}\n"
	end
end