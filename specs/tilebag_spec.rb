require_relative 'spec_helper'
require_relative '../tilebag'

describe Scrabble::Tilebag do
  describe "#initialize" do

    it "can create a new instance of tile bag" do
      tilebag.must_be_instance_of(Scrabble::TileBag)
    end

  end

end
