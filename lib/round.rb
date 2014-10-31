class Round
  NEXT = 'next'
  DONE = 'done'

  attr_reader :filename, :remaining_tries

  def initialize(filename, remaining_tries)
    @filename = filename
    @remaining_tries = remaining_tries

    @next_round = @game_over = @correct = false
    @wrong_guesses = 0
  end

  def guess(guessed_filename)
    correct = @filename == guessed_filename
    correct ? @correct = @next_round = true : @wrong_guesses += 1

    @next_round = true if guessed_filename == NEXT || @wrong_guesses == @remaining_tries

    if guessed_filename == DONE
      @game_over = true
      @next_round = false
     end
  end

  def next_round?
    @next_round
  end

  def game_over?
    @game_over
  end

  def correct?
    @correct
  end
end
