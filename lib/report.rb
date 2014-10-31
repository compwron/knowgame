class Report
  def initialize
    @guessed_files = []
    @correct_guessed_files = []
  end

  def guessed(filename, successful)
    _add_unique(@guessed_files, filename)
    successful ? @correct_guessed_files << filename.strip : nil
  end

  def _add_unique(collection, filename)
    (collection << filename.strip).uniq!
  end

  def summary
    gf = _format(@guessed_files)
    cgf = _format(@correct_guessed_files)
    "Files guessed at: #{@guessed_files.count}\nFiles:\n#{gf}\nCorrect guesses: #{@correct_guessed_files.count}\n#{cgf}"
  end

  def _format(collection)
    a = collection.uniq
    a.join("\n").empty? ? "\n" : a.join("\n") + "\n"
  end
end
