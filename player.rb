module Scrabble
  class Player
    attr_reader :name, :words_played

    def initialize(name)
      if name.class != String || name == ""
        raise ArgumentError.new("Invalid entry. Please enter a name.")
      end

      @name = name
      @words_played = []
    end

    def plays
      @words_played
    end

    def play(word)
      @words_played << word
      return word
    end
  end
end
