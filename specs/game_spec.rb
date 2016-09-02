require_relative 'spec_helper'
require_relative '../game'

describe Scrabble::Game do
  describe "#initialize" do
    let(:game) { Scrabble::Game.new }

    it "can create a new instance of Game" do
      game.must_be_instance_of(Scrabble::Game)
    end

    it "should create a new instance of tilebag" do
      game.tilebag.must_be_instance_of(Scrabble::Tilebag)
    end
  end

  describe "#play_if_allowed" do
    let(:player) { Scrabble::Player.new("Foot Foot") }
    let(:game) { Scrabble::Game.new }

    it "should raise an Argument Error if allowed? is false" do
      player.tiles_in_hand = %w(o o o f t a b)
      proc { game.play_if_allowed(player, "bah") }.must_raise(ArgumentError)
    end
  end
end
