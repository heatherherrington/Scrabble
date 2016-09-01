require_relative "scoring"
require_relative "tilebag"

module Scrabble
  class Player
    attr_reader :name, :words_played

    def initialize(name)
      if name.class != String || name == ""
        raise ArgumentError.new("Invalid entry. Please enter a name.")
      end

      @name = name
      @words_played = []
      @max_word_score = 0
    end

    def plays
      @words_played
    end

    def play(word)
      @words_played << word
      if won?
        return false
      end
      return Scrabble::Scoring.score(word)
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

    def highest_scoring_word
      if @words_played.length == 0
        raise ArgumentError.new("No words have been played.")
      end 

      max_word = nil
      @words_played.each do |word|
        score = Scrabble::Scoring.score(word)
        if score > @max_word_score
          @max_word_score = score
          max_word = word
        end
      end
      return max_word
    end

    def highest_word_score
      highest_scoring_word
      @max_word_score
    end
  end
end
