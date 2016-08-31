require_relative "scoring"

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
      if won?
        return false
      end
      return word
    end

    def total_score
      player_total_score = 0
      @words_played.each do |word|
        player_total_score += Scrabble::Scoring.score(word)
      end
      return player_total_score
    end

    def won?
      total_score > 100
    end
  end
end
