class Round
  def initialize(filename, remaining_tries)
    @filename = filename
    @remaining_tries = remaining_tries

    @next_round = @game_over = @correct = false
    @wrong_guesses = 0
  end

  def guess guessed_filename
  	if @filename == guessed_filename then
  		@correct = @next_round = true
  	else
  		@wrong_guesses += 1
  	end

  	if @wrong_guesses == @remaining_tries then
  		@next_round = true
  	end

  	@next_round = true if guessed_filename == 'next'

  	if guessed_filename == 'done' then
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
