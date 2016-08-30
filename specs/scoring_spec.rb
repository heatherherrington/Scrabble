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

    # it "should take a parameter 'word' of class String" do
    #   Scrabble::Scoring.score("green").must_respond_to("green")
    # end

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

  describe "#self.highest_score_from_array(word_array)" do
    
  end
end
