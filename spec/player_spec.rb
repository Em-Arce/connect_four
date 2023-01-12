require "spec_helper"
require "./player.rb"

describe "Player" do
  describe '#initialize' do
    it 'accepts name and color' do
      player = Player.new("Ayaka", "\u{1f535}")
      expect(player.name).to eq("Ayaka")
      expect(player.color).to eq("\u{1f535}")
    end
  end

  describe '#display' do
    it 'prints name and color in terminal' do
      player = Player.new("Ayaka", "\u{1f535}")
      printout = get_puts{ player.display }
      expect(printout).to include('Ayaka will play 🔵')
    end
  end
end