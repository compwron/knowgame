require_relative 'spec_helper'

describe CommonFiles do
  let(:repo) { 'fake_git' }
  let(:after_date) { '0-1-1' }
  let(:file1) { 'foo.txt' }
  let(:file2) { 'bar.txt' }
  let(:g) { CommonFiles.new repo, after_date, 2 }

  def create_commit(message, filename)
    `cd #{repo} && echo bar >> #{filename} && git add . && git commit -m "#{message}"`
  end

  before :each do
    `mkdir #{repo} && git init #{repo}`
  end

  after :each do
    `rm -rf #{repo}`
  end

  it 'returns files from git history' do
    filename = 'foo.txt'
    create_commit 'some message', filename
    expect(g.files).to include(filename)
  end
end
