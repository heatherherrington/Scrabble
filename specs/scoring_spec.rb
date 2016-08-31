require_relative 'spec_helper'
require_relative '../scoring'

describe Scrabble::Scoring do
  describe "#initialize" do
    let(:scoring_instance) { Scrabble::Scoring.new() }

    it "can create a new instance of Scoring" do
      scoring_instance.must_be_instance_of(Scrabble::Scoring)
    end
  end

  describe "#self.score(word)" do
    #let(:scoring_instance) { Scrabble::Scoring.new() }

    it "should raise an ArgumentError if input is not String" do
      proc { Scrabble::Scoring.score(5) }.must_raise(ArgumentError)
    end

    it "should raise an ArgumentError if input is an empty string" do
      proc { Scrabble::Scoring.score("") }.must_raise(ArgumentError)
    end

    it "should return a Fixnum" do
      Scrabble::Scoring.score("green").must_be_instance_of(Fixnum)
    end

    it "should return the correct Fixnum result" do
      Scrabble::Scoring.score("green").must_equal(6)
    end

    it "should give a 50 point bonus for a seven letter word" do
      Scrabble::Scoring.score("kumquat").must_equal(72)
    end
  end

  describe "#self.highest_score_from(array_of_words)" do
    it "should return a string" do
    Scrabble::Scoring.highest_score_from(["green", "yellow", "kumquat"]).must_be_instance_of(String)
    end

    it "should return word with highest score" do
    Scrabble::Scoring.highest_score_from(["green", "yellow", "kumquat"]).must_equal("kumquat")
    end

    it "should return word with highest score & fewest letters " do
      Scrabble::Scoring.highest_score_from(["taste", "dog"]).must_equal("dog")
    end

    it "should return the first element of many that have same length, same score" do
      Scrabble::Scoring.highest_score_from(["an", "sat", "ant", "rot"]).must_equal("sat")
    end

    it "should return the seven-letter word if both words have the same score" do
      Scrabble::Scoring.highest_score_from(["qzqzqz", "aaaaaah"]).must_equal("aaaaaah")
    end

  end


end
