require_relative 'spec_helper'
require_relative '../scoring'

describe Scrabble::Scoring do
  describe "#initialize" do
    it "can create a new instance of Scoring" do
      Scrabble::Scoring.new.must_be_instance_of(Scoring)
    end
  end
end
