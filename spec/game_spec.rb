require_relative 'spec_helper'

describe Game do
  describe '#play' do
    xit "should end game with 'done'" do
      g = Game.new(['file1.txt', 'file2.txt'], 5)

      # allow(g).to receive(:gets).and_return('done')
      # allow(g).to receive(:_random_line).and_return('a')
      g.stub(:gets).and_return('done')
      g.stub(:_random_line).and_return('a')

      # expect { g.play }.to output(/.*Game score: {:correct=>0, :guesses=>0}/).to_stdout
      g.play
    end
  end

  describe '#_game'
end
