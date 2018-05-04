require 'game'

describe Game do
  let(:the_beast) { double :the_beast, health: 100 }
  let(:mark) { double :mark, health: 10 }
  subject(:game) { described_class.new(the_beast, mark) }

  describe '#initialze' do
    it 'initializes player one' do
      expect(subject.player_one).to eq(the_beast)
    end
    it 'initializes player one' do
      expect(subject.player_two).to eq(mark)
    end
  end

  describe '#attack' do
    it "deducts a player's health when attacked" do
      expect(mark).to receive(:reduce_health)
      subject.attack
    end
  end

  describe 'turn' do
    it "returns true if player one's turn" do
      expect(subject.player_one_turn).to eq true
    end

    it "returns player one if player one's turn" do
      expect(subject.attacker).to eq the_beast
    end

    it "returns player two if player two's turn" do
      allow(mark).to receive(:reduce_health)
      subject.attack
      subject.switch_turn
      expect(subject.attacker).to eq mark
    end
  end

  describe '#switch_turn' do
    it 'should make player_one_turn false' do
      allow(mark).to receive(:reduce_health)
      subject.attack
      subject.switch_turn
      expect(subject.player_one_turn).to eq false
    end
  end

end
