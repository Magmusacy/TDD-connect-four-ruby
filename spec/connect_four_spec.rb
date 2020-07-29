require './connect_four.rb'

describe Cage do
  describe "#insert" do
    it "Inserts player's sign into desired location" do
      cage = Cage.new
      cage.insert(7, "⚪")
      expect(cage.cage.first(7).join).to eql("♿♿♿♿♿♿⚪")
    end

    it "Makes sure you can only use indexes from 1 to 7" do
      cage = Cage.new
      cage.insert(8, "⚪")
      expect(cage.cage.first(8)).not_to eql("♿♿♿♿♿♿♿⚪")
    end
  end

  describe "#check_for_win" do
    it "Checks if given player won the match in the current row" do
      cage = Cage.new
      cage.cage[0] = "⚪"
      cage.cage[1] = "⚪"
      cage.cage[2] = "⚪"
      cage.cage[3] = "⚪"
      expect(cage.check_for_win("⚪")).to eql(true)
    end

    it "Checks if given player won the match in a column" do
      cage = Cage.new
      cage.cage[0] = "⚪"
      cage.cage[7] = "⚪"
      cage.cage[14] = "⚪"
      cage.cage[21] = "⚪"
      expect(cage.check_for_win("⚪")).to eql(true)
    end

    it "Checks if given player won the match along a diagonal" do
      cage = Cage.new
      cage.cage[0] = "⚪"
      cage.cage[8] = "⚪"
      cage.cage[16] = "⚪"
      cage.cage[24] = "⚪"
      expect(cage.check_for_win("⚪")).to eql(true)
    end

    it "Checks if given player won the match along a diagonal" do
      cage = Cage.new
      cage.cage[16] = "⚪"
      cage.cage[12] = "⚪"
      cage.cage[6] = "⚪"
      cage.cage[0] = "⚪"
      expect(cage.check_for_win("⚪")).to eql(true)
    end

    it "Checks if given player won the match along a diagonal" do
      cage = Cage.new
      cage.cage[5] = "⚪"
      cage.cage[13] = "⚪"
      cage.cage[21] = "⚪"
      cage.cage[29] = "⚪"
      expect(cage.check_for_win("⚪")).to eql(true)
    end
  end

end
describe Player do
  describe "#create_player" do
    it "Creates player with it's unique sign" do
      expect(Player.create_player("Carl Johnson", "⚪").class).to eql(Player)
    end
  end
end

