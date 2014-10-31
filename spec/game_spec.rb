require_relative 'spec_helper'

describe Game do
  let(:g) { Game.new ['foo.txt', 'bar.txt'], 2 }

  it 'ends game' do
    g.stub(:gets).and_return('done')
    g.stub(:_lines_from).and_return(['a'])
    g.play

    expect(g.summary).to include("Files guessed at: 1\nFiles:\n")
    expect(g.summary).to include("\n\nCorrect guesses: 0\n\n")
  end
end
