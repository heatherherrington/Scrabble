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
    let(:example_tilebag) { Scrabble::Tilebag.new }

    it "should raise an ArgumentError if input is not a Fixnum" do
      proc { example_tilebag.draw_tiles("") }.must_raise(ArgumentError)
    end

    it "should change the number of tiles in the tilebag" do
      (example_tilebag.draw_tiles(5).length).wont_equal(example_tilebag.draw_tiles(3).length)
    end

    it "should remove the specified number of tiles from the tilebag" do
      (example_tilebag.draw_tiles(5).length + (example_tilebag.tilebag.length - 5)).must_equal(example_tilebag.tilebag.length)
    end

  end

  describe "#tiles_remaining" do
    let(:example_tilebag) { Scrabble::Tilebag.new }

    it "should return a Fixnum" do
      example_tilebag.tiles_remaining.must_be_kind_of(Fixnum)
    end

    it "should return the number of tiles remaining" do
      example_tilebag.draw_tiles(10)
      example_tilebag.tiles_remaining.must_equal(88)
    end

  end

end
