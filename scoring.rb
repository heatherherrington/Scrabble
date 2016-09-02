module Scrabble
  class Scoring

    LETTER_VALUES = {
      1 => %w(A E I O U L N R S T),
      2 => %w(D G),
      3 => %w(B C M P),
      4 => %w(F H V W Y),
      5 => %w(K),
      8 => %w(J X),
      10 => %w(Q Z)
    }

    def self.score(word)
      if word.class != String || word == ""
        raise ArgumentError.new("Please enter a word.")
      end

      word_array = word.upcase.split("")
      total_value = 0

      # Add up value of each inputted word
      word_array.each do |letter|
        LETTER_VALUES.each do |key, value|
          if value.include?(letter)
            total_value += key
          end
          # Returns total value of word
        end
      end

      # Give bonus to words that are maximum number of tiles
      if word_array.length == 7
        total_value += 50
      end
      return total_value
    end

    def self.highest_score_from(array_of_words)
      max_score = 0
      current_word = []

      array_of_words.each do |word|
        score = self.score(word)
        if score >= max_score
          # Clears array if another word is higher, otherwise, it will just generate
          # a giant array of highest scoring words and not be specific when
          # there is a tie
          if score > max_score
            current_word = []
            current_word << word
            max_score = score
          else
            current_word << word
          end
        end
        # Returns array of words with multiple words if there's a tie
      end

      length_of_word = 7
      small_word = nil

      # If there is a tie between a seven-letter word and a shorter word, the array
      # will have both words. This will narrow it down and award the victory to the
      # seven letter word.
      if current_word.length > 0
        current_word.each do |word|
          if word.length == 7
            # Returns seven letter word if there is one
            return word
      # Otherwise, if there is not a seven letter word, the shortest word wins.
          elsif word.length < length_of_word
            length_of_word = word.length
            small_word = word
          end
        end
      end
      # Returns shortest word if there is NOT a seven letter word
      return small_word

    end

  end
end
