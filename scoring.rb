module Scrabble
  class Scoring

    attr_reader :word

    LETTER_VALUES = {
      1 => %w(A E I O U L N R S T),
      2 => %w(D G),
      3 => %w(B C M P),
      4 => %w(F H V W Y),
      5 => %w(K),
      8 => %w(J X),
      10 => %w(Q Z)
    }

    def initialize#(word)
      #@word = word
    end

    def self.score(word)
      word_array = word.upcase.split("")
      total_value = 0

      word_array.each do |letter|
        LETTER_VALUES.each do |key, value|
          if value.include?(letter)
            total_value += key
          end
        end
      end

      if word_array.length == 7
        total_value += 50
      end
      return total_value
    end

  end
end
