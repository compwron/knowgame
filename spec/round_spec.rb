require_relative 'spec_helper'

describe Round do
  let(:remaining_tries) { 3 }
  let(:r) { Round.new 'foo.txt', remaining_tries }

  it 'recognizes one false guess as false and to keep guessing' do
    r.guess 'wrong guess'
    expect(r.next_round?).to eq(false)
    expect(r.game_over?).to eq(false)
    expect(r.correct?).to eq(false)
  end

  it 'recognizes that more false guesses than available tries means continue to the next round' do
    r.guess 'wrong guess'
    r.guess 'wrong guess'
    r.guess 'wrong guess'

    expect(r.next_round?).to eq(true)
    expect(r.game_over?).to eq(false)
    expect(r.correct?).to eq(false)
  end

  it 'recognizes that one correct guess means continue to the next round' do
    r.guess 'foo.txt'

    expect(r.next_round?).to eq(true)
    expect(r.game_over?).to eq(false)
    expect(r.correct?).to eq(true)
  end

  it 'recognizes command to move to next round' do
    r.guess 'next'

    expect(r.next_round?).to eq(true)
    expect(r.game_over?).to eq(false)
    expect(r.correct?).to eq(false)
  end

  it 'recognizes command to move to end game' do
    r.guess 'done'

    expect(r.next_round?).to eq(false)
    expect(r.game_over?).to eq(true)
    expect(r.correct?).to eq(false)
  end
end
