require_relative 'spec_helper'

describe Combo do

  it 'should pick line in range' do
    lines = %w(a b c)
    c = Combo.new(lines)
    expect(c.line_num).to be < 3
    expect(c.line_num).to be >= 0
    expect(lines.include?(c.line)).to be true
  end

  it 'should not pick blank line' do
    lines = ['a', '']
    c = Combo.new(lines)
    expect(c.line).to eq 'a'
  end

  it "should not pick 'end' line" do
    lines = %w(end a)
    c = Combo.new(lines)
    expect(c.line).to eq 'a'
  end

  it 'should show surrounding lines' do
    lines = %w(a b c)
    c = Combo.new(lines)
    expect(c.surrounding_lines).to include('a')
  end
end
