require "spec_helper"
require "./player.rb"
require "./game.rb"
 
describe "Game" do
  let(:player1) {Player.new("Ayaka", "\u{1f535}")}
  let(:player2) {Player.new("Paimon", "\u{1f534}")}

  before do
    player1
    player2
  end
  
  describe '#display' do
    it 'prints board in terminal' do
      game = Game.new(player1, player2)
      printout = get_puts { game.display_board }
      expect(printout).to eq("\n  1   2   3   4   5   6   7\n\n  ⚪  ⚪  ⚪  ⚪  ⚪  ⚪  ⚪  \n  ⚪  ⚪  ⚪  ⚪  ⚪  ⚪  ⚪  \n  ⚪  ⚪  ⚪  ⚪  ⚪  ⚪  ⚪  \n  ⚪  ⚪  ⚪  ⚪  ⚪  ⚪  ⚪  \n  ⚪  ⚪  ⚪  ⚪  ⚪  ⚪  ⚪  \n  ⚪  ⚪  ⚪  ⚪  ⚪  ⚪  ⚪  \n\n")
    end
  end

  describe '#position_occupied? at start of game' do
    it 'should be false' do
      game = Game.new(player1, player2)
      result = game.position_occupied?(1)
      expect(result).to eq(false)
    end
  end

  describe '#all_positions_occupied? at start of game' do
    it 'should be false' do
      game = Game.new(player1, player2)
      result = game.all_positions_occupied?()
      expect(result).to eq(false)
    end
  end
end