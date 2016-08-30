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
      if word.class != String
        raise ArgumentError.new("Please enter a word.")
      end

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

    def self.highest_score_from(array_of_words)
      max_score = 0
      current_word = []

      array_of_words.each do |word|
        if self.score(word) >= max_score
          if self.score(word) > max_score
            current_word = []
            current_word << word
            max_score = self.score(word)
          else
            current_word << word
          end
        end
      end

      length_of_word = 7
      small_word = nil

      if current_word.length > 0
        current_word.each do |word|
          if word.length == 7
            return word
          elsif word.length < length_of_word
            length_of_word = word.length
            small_word = word
          end
        end
      end
      return small_word

    end

  end
end
