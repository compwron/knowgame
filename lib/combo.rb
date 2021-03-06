class Combo
  attr_accessor :line_num, :line

  def initialize(lines)
    @lines = lines
    @line_num = _select_line(lines)
    @line = lines[line_num]
  end

  def _select_line(lines)
    line_num = rand(lines.length)
    s = lines[line_num]
    (s.empty? || s.strip.downcase == 'end') ? _select_line(lines) : line_num
  end

  def surrounding_lines
    [@lines[line_num - 1],
     @lines[line_num],
     @lines[line_num + 1]]
  end
end
