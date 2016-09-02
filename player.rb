require_relative "scoring"
require_relative "tilebag"

module Scrabble
  class Player
    attr_reader :name, :words_played
    attr_accessor :tiles_in_hand

    def initialize(name)
      if name.class != String || name == ""
        raise ArgumentError.new("Invalid entry. Please enter a name.")
      end

      @name = name
      @words_played = []
      @max_word_score = 0
      @tiles_in_hand =[]
    end

    def plays
      @words_played
    end

    # Keeps track of what words each player has played in an array
    def play(word)
      @words_played << word
      if won?
        return false
      end
      # Returns the score of the word if the player has not won
      return Scrabble::Scoring.score(word)
    end

    # Calculates the total score for each player based on the array generated
    # in play(word)
    def total_score
      # COMMENTED CODE IS PRE-ENUMERABLE VERSION
      # player_total_score = 0
      # @words_played.each do |word|
      #   player_total_score += Scrabble::Scoring.score(word)
      # end

      all_scores = @words_played.map do |word|
        Scrabble::Scoring.score(word)
      end
      player_total_score = all_scores.reduce(:+)

      return player_total_score
    end

    # Boolean that determines whether player has won
    def won?
      total_score > 100
    end

    def highest_scoring_word
      if @words_played.length == 0
        raise ArgumentError.new("No words have been played.")
      end

      # Iterates over the words that have been played by this player and finds
      # the word with the highest total score. Returns that word.
      max_word = nil
      @words_played.each do |word|
        score = Scrabble::Scoring.score(word)
        # Keeps track of both word and score, to avoid duplication of code
        # in highest_word_score
        if score > @max_word_score
          @max_word_score = score
          max_word = word
        end
      end
      return max_word
    end

    # Uses highest_scoring_word to return the score of that word
    def highest_word_score
      highest_scoring_word
      @max_word_score
    end


    def tiles
      return @tiles_in_hand
    end

    # Maximum number of tiles player can have is seven. Bases tiles drawn from
    # tile bag off of max tiles (7) minus how many tiles that player has and
    # puts drawn tiles into that player's tiles_in_hand
    def draw_player_tiles(tilebag)
      num = 7 - @tiles_in_hand.length

      new_tiles = tilebag.draw_tiles(num)

      new_tiles.each do |tile|
        @tiles_in_hand << tile
      end
      return @tiles_in_hand
    end

    # splits argument into an array and iterates over array
    # if letter is in tiles_in_hand, removes that tile
    # and returns amended tiles_in_hand
    def split_word(word)

    end

    def delete_played_tiles(word)
      word_array = word.split("")
      word_array.each do |letter|
        if @tiles_in_hand.include?(letter)
          @tiles_in_hand.slice!(@tiles_in_hand.index(letter))
        end
      end
      return @tiles_in_hand
    end

    def allowed?(word)
      tracking = @tiles_in_hand.clone
      word_array = word.split("")

      word_array.each do |letter|
        if tracking.include?(letter)
          tracking.slice!(tracking.index(letter))
        end
      end

      tracking << word_array
      tracking = tracking.flatten

      @tiles_in_hand.length == tracking.length

    end
  end
end


# deleting played tiles from tilebag
