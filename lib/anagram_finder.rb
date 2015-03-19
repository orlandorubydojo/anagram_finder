class AnagramFinder
  attr_reader :dictionary

  def initialize(options={})
    @word = options[:word]
    @dictionary = options[:dictionary]
  end

  def word
    raise TypeError unless @word
    @word
  end

  def detect
    if select_words.empty?
      "No Anagrams were detected for #{word}"
    else
      select_words
    end
  end

  private

  def select_words
    dictionary.select do |dictionary_word|
      unless indentical?(dictionary_word)
        anagram_of?(dictionary_word)
      end
    end
  end

  def indentical?(dictionary_word)
    dictionary_word.downcase == word.downcase
  end

  def anagram_of?(dictionary_word)
    dictionary_word.downcase.split('').sort == word.downcase.split('').sort
  end

end
