require_relative 'spec_helper'

describe Report do
  let(:r) { Report.new }

  it 'summary is empty when there are no guesses' do
    expect(r.summary).to eq("Files guessed at: 0
Files:

Correct guesses: 0
")
  end

  it 'summary includes successful guesses' do
    r.guessed 'foo.txt', true
    expect(r.summary).to eq("Files guessed at: 1
Files:
foo.txt

Correct guesses: 1
foo.txt
")
  end

  it 'summary includes failed guesses' do
    r.guessed 'foo.txt', true
    expect(r.summary).to eq("Files guessed at: 1
Files:
foo.txt

Correct guesses: 0
")
  end

  it 'summary includes multiple guesses' do
    r.guessed 'foo.txt', true
    r.guessed 'bar.txt', false

    expect(r.summary).to eq("Files guessed at: 1
Files:
foo.txt
bar.txt

Correct guesses: 1
foo.txt
")
  end

  it 'does not dupe duped guesses but gives credit for correct guesses' do
    r.guessed 'foo.txt', true
    r.guessed 'foo.txt', true

    expect(r.summary).to eq("Files guessed at: 1
Files:
foo.txt

Correct guesses: 2
foo.txt
")
  end
end
