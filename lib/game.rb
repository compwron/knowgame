require_relative 'combo'
require_relative 'report'
require_relative 'round'

class Game
  def initialize(common_files, tries)
    @common_files = common_files
    @tries = tries
    @report = Report.new
  end

  def play
    _print_instructions

    keep_going = true
    while keep_going
      filename = @common_files.sample
      combo = _random_line(_lines_from filename)
      puts "\nLine is: #{combo.line}"
      puts 'What file is this line from?'
      keep_going = _guess(Round.new(filename, @tries), combo)
    end
  end

  def _lines_from(filename)
    File.readlines filename
  end

  def _guess(round, combo)
    filename = round.filename
    if round.next_round?
      round = new Round(round.filename, round.remaining_tries)
      return true
    end
    current = gets.chomp

    round.guess current
    if round.game_over?
      _record filename, false
      false
    elsif round.next_round?
      _record filename, false
      true
    elsif round.correct?
      _record filename, true
      puts 'Correct!'
    else
      _record round.filename, false
      puts "You are wrong. Remaining tries: #{round.remaining_tries}"
      puts 'expanded context:\n'
      puts _expanded_context(combo)
      _guess(Round.new(round.filename, round.remaining_tries - 1), combo)
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

  def _print_instructions
    puts "Type 'done' to end game
    To win the round, guess the filename which contains the line
    To give up and get new data, type 'next'"
  end

  def summary
    @report.summary
  end
end
