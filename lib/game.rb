class Game

  attr_reader :player_one, :player_two, :player_one_turn

  def initialize(player_one, player_two)
    @player_one = player_one
    @player_two = player_two
    @player_one_turn = false
  end

  def attack
    @player_one_turn ? @player_two.reduce_health : @player_one.reduce_health
  end

  def switch_turn
    @player_one_turn = !@player_one_turn
  end

  def attacker
    @player_one_turn? @player_one : @player_two
  end

  def defender
    @player_one_turn? @player_two : @player_one
  end

end
