require_relative 'player'
module Scrabble
  class Tilebag
    attr_reader :tilebag

    NUMBER_OF_LETTERS = {
      "A" => 9,
      "B" => 2,
      "C" => 2,
      "D" => 4,
      "E" => 12,
      "F" => 2,
      "G" => 3,
      "H" => 2,
      "I" => 9,
      "J" => 1,
      "K" => 1,
      "L" => 4,
      "M" => 2,
      "N" => 6,
      "O" => 8,
      "P" => 2,
      "Q" => 1,
      "R" => 6,
      "S" => 4,
      "T" => 6,
      "U" => 4,
      "V" => 2,
      "W" => 2,
      "X" => 1,
      "Y" => 2,
      "Z" => 1
    }

      def initialize
        # Generates an array of tiles based on the hash above
        # We did this to use the map enumerable

        # Previously created empty array and iterated over
        # hash using each to fill array with tiles
        tilebag = NUMBER_OF_LETTERS.map do |key, value|
          (key * value).split("")
        end
        # at this point, we have an array of arrays and this
        # reduces it to one array
        @tilebag = tilebag.join.split("")
      end

      def draw_tiles(num)
        player_tiles = []
        if num.class != Fixnum
          raise ArgumentError.new("Please enter a number")
        end

        # Puts 'num' tiles from tile bag into player's bag and removed those
        # tiles from the tile bag
        num.times do
          player_tiles << @tilebag.delete_at(rand(@tilebag.length))
        end

        return player_tiles
      end

      def tiles_remaining
        return @tilebag.length
      end

  end
end
