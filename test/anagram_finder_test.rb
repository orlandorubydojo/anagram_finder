require './test_helper'
require './lib/anagram_finder'
require 'pry'

class AnagramFinderTest < Minitest::Test

  def test_instance_of_anagram_finder
    anagram_finder = AnagramFinder.new
    assert_instance_of AnagramFinder, anagram_finder
  end

  def test_anagram_accepts_an_argument_for_word
    anagram_finder = AnagramFinder.new(word: 'foo')
    assert_equal 'foo', anagram_finder.word
  end

  def test_anagram_finder_has_a_dictionary
    anagram_finder = AnagramFinder.new(dictionary: ['god','goose', 'sod'])
    assert_equal ['god','goose', 'sod'], anagram_finder.dictionary
  end

  def test_raises_error_if_no_word_is_given
    anagram_finder = AnagramFinder.new
    assert_raises(TypeError) { anagram_finder.word }
  end

  def test_detects_a_single_anagram
    anagram_finder = AnagramFinder.new(word: 'dog', dictionary: ['god','goose', 'sod'])
    assert_equal ['god'], anagram_finder.detect
  end

  def test_detects_multiple_anagrams
     anagram_finder = AnagramFinder.new(word: 'dog', dictionary: ['god','goose', 'gdo'])
     assert_equal ['god', 'gdo'], anagram_finder.detect
  end

  def test_anagram_words_are_case_insensitive
    anagram_finder = AnagramFinder.new(word: 'dog', dictionary: ['God','goose', 'Gdo'])
    assert_equal ['God', 'Gdo'], anagram_finder.detect
  end

  def test_display_message_if_no_anagrams_are_detected
    anagram_finder = AnagramFinder.new(word: 'dog', dictionary: ['cat','mouse'])
    assert_equal 'No Anagrams were detected for dog', anagram_finder.detect
  end

  def test_indentical_words_are_not_anagrams
    anagram_finder = AnagramFinder.new(word: 'dog', dictionary: ['dog', 'Dog'])
    assert_equal 'No Anagrams were detected for dog', anagram_finder.detect
  end
end
