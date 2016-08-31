require_relative 'spec_helper'
require_relative '../player'

describe Scrabble::Player do
  describe "#initialize" do
    let(:player) { Scrabble::Player.new("Foot Foot") }

    it "can create a new instance of Player" do
      player.must_be_instance_of(Scrabble::Player)
    end

    it "should have a name property" do
      player.must_respond_to(:name)
    end

    it "should raise an ArgumentError if input is not String" do
      proc { Scrabble::Player.new(5) }.must_raise(ArgumentError)
    end

    it "should raise an ArgumentError if input is an empty string" do
      proc { Scrabble::Player.new("") }.must_raise(ArgumentError)
    end

    it "should return value of @name" do
      player.name.must_equal("Foot Foot")
    end
  end

  describe "#plays" do
    let(:player) { Scrabble::Player.new("Foot Foot") }

    it "should return an Array" do
      player.plays.must_be_kind_of(Array)
    end

    it "should return an Array of words played by the player" do
      player.plays.must_equal(player.words_played)
    end
  end

  describe "#play" do
    let(:player) { Scrabble::Player.new("Foot Foot") }

    it "the last element of the array should equal the input value" do
       player.play("fuzzy").must_equal(player.words_played.last)
    end

    it "should return false if player has won" do
      player.play("zzzzzzz").must_equal(false)
    end
  end

  describe "#total score" do
    let(:player) { Scrabble::Player.new("Foot Foot") }

    it "should return a Fixnum" do
      player.total_score.must_be_kind_of(Fixnum)
    end

    it "should be total score of words played array" do
      player.play("cat")
      player.play("dog")
      player.play("bee")
      player.total_score.must_equal(15)
    end
  end

  describe "#won?" do
    let(:player) { Scrabble::Player.new("Foot Foot") }

    it "should return a true" do
      player.play("zzzzzzz")
      player.won?.must_equal(true)
    end

    it "should return a false" do
      player.play("bah")
      player.won?.must_equal(false)
    end
  end
end