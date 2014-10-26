require_relative "spec_helper"

describe Game do
  describe "#play" do
    it "should end game with 'done'" do
      g = Game.new(['file1.txt', 'file2.txt'], 5)
      g.stub(:gets).and_return('done')
      g.stub(:_random_line).and_return('a')
      g.play
      
    end
   end
end