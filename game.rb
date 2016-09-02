require_relative 'player'
require_relative 'tilebag'
require_relative 'scoring'

module Scrabble
  class Game

    attr_reader :tilebag

    def initialize
      @tilebag = Scrabble::Tilebag.new
    end

    def play_if_allowed(player, word)
      player.draw_player_tiles(@tilebag)
      if player.allowed?(word)
        player.play(word)
        player.delete_played_tiles(word)
      else
        raise ArgumentError.new("You do not have the tiles to play that word.")
      end
    end

  end
end
