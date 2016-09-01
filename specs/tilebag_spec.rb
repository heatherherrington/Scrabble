require_relative 'spec_helper'
require_relative '../tilebag'

describe Scrabble::Tilebag do
  describe "#initialize" do
    let(:tilebag) { Scrabble::Tilebag.new }

    it "can create a new instance of tile bag" do
      tilebag.must_be_instance_of(Scrabble::Tilebag)
    end
  end

  describe "#draw_tiles(num)" do
    let(:tilebag) { Scrabble::Tilebag.new }

    it "should raise an ArgumentError if input is not a Fixnum" do
      proc { tilebag.draw_tiles("") }.must_raise(ArgumentError)
    end
  end

end
