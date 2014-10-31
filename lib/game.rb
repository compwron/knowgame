require_relative 'combo'
require_relative 'report'

class Game
  attr_accessor :record_keeper
  def initialize(common_files, tries)
    @common_files = common_files
    @tries = tries
    @record_keeper = { correct: 0, guesses: 0 }
    @report = Report.new
  end

  def play
    _print_instructions

    keep_going = true
    while keep_going
      filename = @common_files.sample
      combo = _random_line(File.readlines(filename))
      puts "\nLine is: #{combo.line}"
      puts 'What file is this line from?'
      keep_going = _guess(filename, @tries, combo)
    end
  end

  def _guess(filename, remaining_tries, combo)
    #  maybe introduce the concept of a round?

    if remaining_tries < 0
      _mercy filename
      return true
    end
    current = gets.chomp
    case current
    when 'done'
      _record filename, false
      _mercy filename
      false
    when 'next'
      _record filename, false
      _mercy filename
      true
    else
      if current == filename
        _record filename, true
        puts 'Correct!'
        @record_keeper[:correct] += 1
      else
        _record filename, false
        puts "You are wrong. Remaining tries: #{remaining_tries}"
        puts 'expanded context:\n'
        puts _expanded_context(combo)
        _guess(filename, remaining_tries - 1, combo)
      end
    end
  end

  def _record(filename, success)
    @report.guessed filename, success
  end

  def _expanded_context(combo)
    puts combo.surrounding_lines
  end

  def _random_line(lines)
    Combo.new(lines)
  end

  def _mercy(filename)
    puts "File was: #{filename}"
  end

  def _print_instructions
    puts "Type 'done' to end game
    To win the round, guess the filename which contains the line
    To give up and get new data, type 'next'"
  end

  def summary
    @report.summary
  end
end
